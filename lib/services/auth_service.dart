import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../graphql/queries/auth.graphql.dart';
import '../graphql/queries/form_queries.graphql.dart';
import '../config.dart';
import './form_data_service.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthService extends ChangeNotifier {
  static AuthService? _instance;
  static AuthService get instance => _instance ??= AuthService._();

  AuthService._() {
    _initialize();
  }

  AuthStatus _status = AuthStatus.unknown;
  String? _token;
  String? _refreshToken;
  GraphQLClient? _client;
  Query$Me$me? _user;
  Query$GetMyFpo$myFpo? _userFpo;

  AuthStatus get status => _status;
  String? get token => _token;
  String? get refreshToken => _refreshToken;
  Query$Me$me? get user => _user;
  Query$GetMyFpo$myFpo? get userFpo => _userFpo;
  bool get isAuthenticated =>
      _status == AuthStatus.authenticated && !_isTokenExpired();
  bool get hasUserFpo => _userFpo != null;

  // Multi-FPO support
  String? _currentFpoId;
  String? get currentFpoId => _currentFpoId;
  List<Query$GetAllMyFpos$allMyFpos$edges$node>? _myFpos;
  List<Query$GetAllMyFpos$allMyFpos$edges$node>? get myFpos => _myFpos;
  bool get hasMultipleFpos => _myFpos != null && _myFpos!.length > 1;

  String? get currentFpoVerificationStatus {
    for (final fpo in _myFpos ?? const []) {
      if (fpo.id == _currentFpoId) return fpo.verificationStatus;
    }
    if (_userFpo?.id == _currentFpoId) {
      return _userFpo?.verificationStatus;
    }
    return null;
  }

  String? get currentFpoVerificationNotes {
    for (final fpo in _myFpos ?? const []) {
      if (fpo.id == _currentFpoId) return fpo.verificationNotes;
    }
    if (_userFpo?.id == _currentFpoId) {
      return _userFpo?.verificationNotes;
    }
    return null;
  }

  bool _isTokenExpired() {
    if (_token == null) return true;

    try {
      final parts = _token!.split('.');
      if (parts.length != 3) return true;

      final payload = parts[1];
      final normalized = base64Url.normalize(payload);
      final decoded = utf8.decode(base64Url.decode(normalized));
      final Map<String, dynamic> tokenData = json.decode(decoded);

      final exp = tokenData['exp'] as int?;
      if (exp == null) return true;

      final expirationDate = DateTime.fromMillisecondsSinceEpoch(exp * 1000);
      final now = DateTime.now();

      debugPrint('Auth: Token expires at: $expirationDate');
      debugPrint('Auth: Current time: $now');
      debugPrint('Auth: Token expired: ${now.isAfter(expirationDate)}');

      return now.isAfter(expirationDate);
    } catch (e) {
      debugPrint('Auth: Error parsing token: $e');
      return true;
    }
  }

  GraphQLClient get client {
    if (_client == null) {
      debugPrint('Auth: GraphQL endpoint: ${Config.GRAPHQL_ENDPOINT}');
      final httpLink = HttpLink(
        Config.GRAPHQL_ENDPOINT,
        defaultHeaders: {'Content-Type': 'application/json'},
      );

      final authLink = AuthLink(
        getToken: () async => _token != null ? 'Bearer $_token' : null,
      );

      final link = authLink.concat(httpLink);

      _client = GraphQLClient(
        link: link,
        cache: GraphQLCache(store: HiveStore()),
      );
    }
    return _client!;
  }

  Future<void> _initialize() async {
    try {
      debugPrint('Auth: Starting initialization');
      await _loadTokensFromStorage();
      debugPrint(
        'Auth: Loaded tokens from storage - token exists: ${_token != null}',
      );

      if (_token != null) {
        debugPrint('Auth: Verifying existing token');
        await _verifyAndRefreshToken();
      } else {
        debugPrint('Auth: No token found, setting unauthenticated');
        _setStatus(AuthStatus.unauthenticated);
      }
    } catch (e) {
      debugPrint('Auth initialization error: $e');
      _setStatus(AuthStatus.unauthenticated);
    }
  }

  Future<void> _loadTokensFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('auth_token');
    _refreshToken = prefs.getString('refresh_token');
    await _loadCurrentFpoFromStorage();
  }

  Future<void> _saveTokensToStorage() async {
    final prefs = await SharedPreferences.getInstance();
    if (_token != null) {
      await prefs.setString('auth_token', _token!);
    }
    if (_refreshToken != null) {
      await prefs.setString('refresh_token', _refreshToken!);
    }
  }

  Future<void> _clearTokensFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    await prefs.remove('refresh_token');
    await prefs.remove('current_fpo_id');
  }

  void _setStatus(AuthStatus status) {
    if (_status != status) {
      _status = status;
      notifyListeners();
    }
  }

  Future<void> _verifyAndRefreshToken() async {
    if (_token == null) {
      _setStatus(AuthStatus.unauthenticated);
      return;
    }

    try {
      // Try to get current user info to verify token
      final result = await client.query$Me(
        Options$Query$Me(fetchPolicy: FetchPolicy.networkOnly),
      );

      if (result.hasException) {
        debugPrint('Token verification failed: ${result.exception}');
        // Token might be expired, try to refresh
        if (_refreshToken != null) {
          await _refreshTokens();
        } else {
          await _handleAuthFailure();
        }
      } else {
        // Token is valid
        _user = result.parsedData?.me;
        // Check if user has FPO
        await _checkUserFpo();
        _setStatus(AuthStatus.authenticated);
      }
    } catch (e) {
      debugPrint('Token verification error: $e');
      await _handleAuthFailure();
    }
  }

  Future<void> _refreshTokens() async {
    if (_refreshToken == null) {
      await _handleAuthFailure();
      return;
    }

    try {
      final result = await client.mutate$RefreshToken(
        Options$Mutation$RefreshToken(
          variables: Variables$Mutation$RefreshToken(
            refreshToken: _refreshToken!,
          ),
        ),
      );

      if (result.hasException) {
        await _handleAuthFailure();
        return;
      }

      final data = result.parsedData?.refreshToken;
      if (data != null) {
        _token = data.token;
        _refreshToken = data.refreshToken;
        await _saveTokensToStorage();

        // Reinitialize client with new token
        _client = null;

        // Verify the new token by getting user info
        final userResult = await client.query$Me();
        if (userResult.hasException) {
          await _handleAuthFailure();
        } else {
          _user = userResult.parsedData?.me;
          // Check if user has FPO
          await _checkUserFpo();
          _setStatus(AuthStatus.authenticated);
        }
      } else {
        await _handleAuthFailure();
      }
    } catch (e) {
      debugPrint('Token refresh error: $e');
      await _handleAuthFailure();
    }
  }

  Future<void> _checkUserFpo() async {
    try {
      // Initialize FormDataService if not already done
      if (!FormDataService.isInitialized) {
        FormDataService.initialize(client);
      }

      _userFpo = await FormDataService.instance.getMyFpo();
      debugPrint('Auth: User FPO check - has FPO: ${_userFpo != null}');

      // Load all FPOs for multi-FPO support
      await _loadAllMyFpos();
    } catch (e) {
      debugPrint('Auth: Failed to check user FPO: $e');
      _userFpo = null;
      _myFpos = null;
      _currentFpoId = null;
    }
  }

  Future<void> _handleAuthFailure() async {
    _token = null;
    _refreshToken = null;
    _user = null;
    _userFpo = null;
    _client = null;
    await _clearTokensFromStorage();
    _setStatus(AuthStatus.unauthenticated);
  }

  Future<bool> signIn(String username, String password) async {
    try {
      final result = await client.mutate$SignIn(
        Options$Mutation$SignIn(
          variables: Variables$Mutation$SignIn(
            username: username,
            password: password,
          ),
        ),
      );

      if (result.hasException) {
        debugPrint('Sign in error: ${result.exception}');
        return false;
      }

      final data = result.parsedData?.signIn;
      if (data != null) {
        _token = data.token;
        _refreshToken = data.refreshToken;
        await _saveTokensToStorage();

        // Reinitialize client with new token
        _client = null;

        // Get user info
        final userResult = await client.query$Me();
        if (!userResult.hasException) {
          _user = userResult.parsedData?.me;
        }

        // Check if user has FPO
        await _checkUserFpo();

        _setStatus(AuthStatus.authenticated);
        return true;
      }

      return false;
    } catch (e) {
      debugPrint('Sign in error: $e');
      return false;
    }
  }

  /// Creates an account without signing the user in.
  /// Returns null on success or a user-facing error message on failure.
  Future<String?> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      final normalizedEmail = email.trim().toLowerCase();
      final result = await client.mutate$CreateAccount(
        Options$Mutation$CreateAccount(
          variables: Variables$Mutation$CreateAccount(
            username: normalizedEmail,
            email: normalizedEmail,
            password: password,
            firstName: firstName.trim(),
            lastName: lastName.trim(),
          ),
        ),
      );

      if (result.hasException) {
        debugPrint('Sign up error: ${result.exception}');
        final graphqlErrors = result.exception?.graphqlErrors;
        if (graphqlErrors != null && graphqlErrors.isNotEmpty) {
          return graphqlErrors.first.message;
        }
        return 'Unable to create your account. Please try again.';
      }

      final data = result.parsedData?.createAccount;
      if (data?.success == true) return null;
      return data?.message ??
          'Unable to create your account. Please try again.';
    } catch (e) {
      debugPrint('Sign up error: $e');
      return 'Unable to create your account. Please try again.';
    }
  }

  Future<void> refreshFpoStatus() async {
    if (isAuthenticated) {
      await _checkUserFpo();
      notifyListeners();
    }
  }

  // Multi-FPO support methods
  Future<void> _loadAllMyFpos() async {
    try {
      final allFposResult = await FormDataService.instance.getAllMyFpos();
      _myFpos = allFposResult?.allMyFpos?.edges
          .map((edge) => edge?.node)
          .whereType<Query$GetAllMyFpos$allMyFpos$edges$node>()
          .toList();
      debugPrint('Auth: Loaded ${_myFpos?.length ?? 0} FPOs');

      // Set current FPO ID - prioritize primary FPO, then first in list
      if (_userFpo != null) {
        _currentFpoId = _userFpo!.id;
      } else if (_myFpos != null && _myFpos!.isNotEmpty) {
        _currentFpoId = _myFpos!.first.id;
      } else {
        _currentFpoId = null;
      }

      // Save to shared preferences
      await _saveCurrentFpoToStorage();
    } catch (e) {
      debugPrint('Auth: Failed to load all FPOs: $e');
      _myFpos = null;
      _currentFpoId = null;
    }
  }

  Future<void> setCurrentFpo(String fpoId) async {
    _currentFpoId = fpoId;
    await _saveCurrentFpoToStorage();
    notifyListeners();
  }

  Future<void> _saveCurrentFpoToStorage() async {
    final prefs = await SharedPreferences.getInstance();
    if (_currentFpoId != null) {
      await prefs.setString('current_fpo_id', _currentFpoId!);
    } else {
      await prefs.remove('current_fpo_id');
    }
  }

  Future<void> _loadCurrentFpoFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    _currentFpoId = prefs.getString('current_fpo_id');
  }

  // Financial Year storage methods
  Future<void> saveSelectedFinancialYear(String financialYear) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_financial_year', financialYear);
  }

  Future<String?> getSelectedFinancialYear() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('selected_financial_year');
  }

  Future<bool> signOut() async {
    try {
      // Call logout mutation
      final result = await client.mutate$Logout();

      if (result.hasException) {
        debugPrint('Logout error: ${result.exception}');
      }

      // Clear local data regardless of server response
      await _handleAuthFailure();
      return true;
    } catch (e) {
      debugPrint('Sign out error: $e');
      // Clear local data even if server call fails
      await _handleAuthFailure();
      return true;
    }
  }

  Future<void> checkAuthStatus() async {
    if (_status == AuthStatus.unknown) {
      try {
        await _initialize().timeout(
          const Duration(seconds: 10),
          onTimeout: () {
            debugPrint('Auth: Initialization timeout, setting unauthenticated');
            _setStatus(AuthStatus.unauthenticated);
          },
        );
      } catch (e) {
        debugPrint('Auth: Check status error: $e');
        _setStatus(AuthStatus.unauthenticated);
      }
    }
  }
}
