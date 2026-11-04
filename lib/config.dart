class Config {
  static const String _configuredGraphqlEndpoint = String.fromEnvironment(
    'GRAPHQL_ENDPOINT',
  );

  static const String _defaultGraphqlEndpoint =
      'http://localhost:8000/graphql/';

  /// Set the server at build time, for example:
  /// --dart-define=GRAPHQL_ENDPOINT=http://10.0.2.2:8000/graphql/
  static String get GRAPHQL_ENDPOINT {
    if (_configuredGraphqlEndpoint.isNotEmpty) {
      return _configuredGraphqlEndpoint;
    }

    return _defaultGraphqlEndpoint;
  }

  // Environment-specific configurations
  static bool get isProduction =>
      GRAPHQL_ENDPOINT == _defaultGraphqlEndpoint;

  // Timeout configurations
  static const Duration defaultTimeout = Duration(seconds: 30);
  static const Duration uploadTimeout = Duration(minutes: 2);
}
