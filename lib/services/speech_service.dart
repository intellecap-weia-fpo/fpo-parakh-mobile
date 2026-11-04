import 'dart:async';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:shared_preferences/shared_preferences.dart';

class SpeechService {
  static final SpeechService _instance = SpeechService._internal();
  factory SpeechService() => _instance;
  SpeechService._internal();

  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isInitialized = false;
  bool _isInitializing = false;

  // Supported Indian languages with their locale codes
  final Map<String, String> indianLanguages = {
    'en-IN': 'English (India)',
    'hi-IN': 'Hindi',
    'bn-IN': 'Bengali',
    'te-IN': 'Telugu',
    'mr-IN': 'Marathi',
    'ta-IN': 'Tamil',
    'ur-IN': 'Urdu',
    'gu-IN': 'Gujarati',
    'kn-IN': 'Kannada',
    'or-IN': 'Odia',
    'pa-IN': 'Punjabi',
    'ml-IN': 'Malayalam',
    'as-IN': 'Assamese',
  };

  Future<bool> initialize() async {
    if (_isInitialized) return true;
    if (_isInitializing) return false;

    _isInitializing = true;
    try {
      _isInitialized = await _speech.initialize(
        onStatus: (status) {
          // Handle status changes if needed
        },
        onError: (error) {
          // Handle initialization errors
        },
      );
      return _isInitialized;
    } catch (e) {
      _isInitialized = false;
      return false;
    } finally {
      _isInitializing = false;
    }
  }

  Future<String?> getSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('voice_input_language');
  }

  Future<void> saveLanguage(String language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('voice_input_language', language);
  }

  Stream<String> startListening({
    required String localeId,
    Duration? listenFor,
    Duration? pauseFor,
    Function(String)? onError,
  }) {
    final controller = StreamController<String>();

    if (!_isInitialized) {
      onError?.call('Speech recognition not initialized');
      controller.close();
      return controller.stream;
    }

    try {
      _speech.listen(
        onResult: (result) {
          if (result.recognizedWords.isNotEmpty) {
            controller.add(result.recognizedWords);
          }
        },
        listenFor: listenFor ?? const Duration(minutes: 2),
        pauseFor: pauseFor ?? const Duration(seconds: 5),
        partialResults: true,
        localeId: localeId,
        listenMode: stt.ListenMode.dictation,
        cancelOnError: false,
      );
    } catch (e) {
      onError?.call('Failed to start listening: $e');
      controller.addError(e);
      controller.close();
    }

    return controller.stream;
  }

  Future<void> stopListening() async {
    if (_isInitialized) {
      await _speech.stop();
    }
  }

  bool get isListening => _speech.isListening;
  bool get isAvailable => _isInitialized;
}
