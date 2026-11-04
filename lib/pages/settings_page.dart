import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpo/services/auth_service.dart';
import 'package:fpo/services/speech_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';
import '../utils/voice_input_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _profileFormKey = GlobalKey<FormState>();
  final _testVoiceController = TextEditingController();
  final SpeechService _speechService = SpeechService();
  String _selectedVoiceLanguage = 'en-IN';
  bool _isLoadingLanguage = true;

  @override
  void initState() {
    super.initState();
    _loadVoiceLanguagePreference();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _testVoiceController.dispose();
    super.dispose();
  }

  Future<void> _loadVoiceLanguagePreference() async {
    final savedLanguage = await _speechService.getSavedLanguage();
    setState(() {
      _selectedVoiceLanguage = savedLanguage ?? 'en-IN';
      _isLoadingLanguage = false;
    });
  }

  Future<void> _saveVoiceLanguagePreference(String language) async {
    await _speechService.saveLanguage(language);
    setState(() {
      _selectedVoiceLanguage = language;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Voice language preference saved'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  String? get _displayName {
    final user = AuthService.instance.user;
    if (user?.firstName != null && user?.lastName != null) {
      return '${user!.firstName} ${user.lastName}'.trim();
    } else if (user?.firstName != null) {
      return user?.firstName!;
    } else if (user?.lastName != null) {
      return user?.lastName!;
    } else if (user?.username != null) {
      return user?.username!;
    }
    return 'Unknown User';
  }

  String get _userEmail {
    return AuthService.instance.user?.email ?? 'No email';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          const _SectionHeader(title: 'Account'),
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text(
              _displayName ?? "",
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Container(
                  width: double.infinity,
                  child: Text(
                    _userEmail,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
            isThreeLine: true,
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => _showEditProfileDialog(context),
              tooltip: 'Edit Profile',
            ),
          ),
          const Divider(),

          const _SectionHeader(title: 'Voice Input Settings'),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text(
              'Voice Recognition Language',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: _isLoadingLanguage
                ? const Text('Loading...')
                : Text(
                    _speechService.indianLanguages[_selectedVoiceLanguage] ??
                        'English (India)',
                  ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showLanguageSelector(context),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Test Voice Input',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                VoiceInputWidget(
                  controller: _testVoiceController,
                  hintText: 'Tap the microphone and try speaking...',
                  showLanguageSelector: false,
                  maxLines: 3,
                ),
                const SizedBox(height: 8),
                Text(
                  'Test your voice recognition with the selected language above.',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Logout'),
                      content: const Text('Are you sure you want to logout?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () async {
                            Navigator.of(context).pop();
                            await AuthService.instance.signOut();
                            if (context.mounted) {
                              context.go('/');
                            }
                          },
                          child: const Text('Logout'),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 48),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showEditProfileDialog(BuildContext context) {
    _nameController.text = _displayName ?? "";
    _emailController.text = _userEmail;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Profile'),
          contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: SingleChildScrollView(
              child: Form(
                key: _profileFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Full Name',
                        prefixIcon: Icon(Icons.person_outline),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your full name';
                        }
                        if (value.trim().length < 2) {
                          return 'Name must be at least 2 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        prefixIcon: const Icon(Icons.email_outlined),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.copy, size: 20),
                          onPressed: () {
                            if (_emailController.text.isNotEmpty) {
                              Clipboard.setData(
                                ClipboardData(text: _emailController.text),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Email copied to clipboard'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          },
                          tooltip: 'Copy email',
                        ),
                        border: const OutlineInputBorder(),
                        helperText:
                            'Your email address for account notifications',
                        helperMaxLines: 2,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      scrollPhysics: const BouncingScrollPhysics(),
                      maxLines: null,
                      minLines: 1,
                      style: const TextStyle(fontSize: 16, height: 1.2),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your email address';
                        }
                        final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                        if (!emailRegex.hasMatch(value.trim())) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _nameController.clear();
                _emailController.clear();
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_profileFormKey.currentState?.validate() ?? false) {
                  _updateProfile();
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Save Changes'),
            ),
          ],
        );
      },
    );
  }

  void _updateProfile() {
    // TODO: Implement actual profile update API call
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profile update functionality will be implemented'),
        backgroundColor: Colors.orange,
      ),
    );

    _nameController.clear();
    _emailController.clear();
  }

  Future<void> _showLanguageSelector(BuildContext context) async {
    if (_isLoadingLanguage) return;

    final selectedLanguage = await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select Voice Recognition Language'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _speechService.indianLanguages.length,
              itemBuilder: (context, index) {
                final languageCode = _speechService.indianLanguages.keys
                    .elementAt(index);
                final languageName =
                    _speechService.indianLanguages[languageCode];
                return RadioListTile<String>(
                  title: Text(languageName!),
                  value: languageCode,
                  groupValue: _selectedVoiceLanguage,
                  onChanged: (value) {
                    Navigator.of(context).pop(value);
                  },
                  activeColor: Theme.of(context).primaryColor,
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );

    if (selectedLanguage != null &&
        selectedLanguage != _selectedVoiceLanguage) {
      await _saveVoiceLanguagePreference(selectedLanguage);
    }
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
