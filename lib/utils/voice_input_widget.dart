import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../services/speech_service.dart';
import 'input_formatters.dart';

class VoiceInputWidget extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final ValueChanged<String>? onTextChanged;
  final bool showLanguageSelector;
  final int? maxLines;
  final TextInputType? keyboardType;
  final bool readOnly;
  final bool showTextField;
  final bool showMicAlways;

  const VoiceInputWidget({
    Key? key,
    required this.controller,
    this.hintText,
    this.onTextChanged,
    this.showLanguageSelector = false,
    this.maxLines,
    this.keyboardType,
    this.readOnly = false,
    this.showTextField = true,
    this.showMicAlways = true,
  }) : super(key: key);

  @override
  State<VoiceInputWidget> createState() => _VoiceInputWidgetState();
}

class _VoiceInputWidgetState extends State<VoiceInputWidget> {
  final SpeechService _speechService = SpeechService();
  bool _isListening = false;
  String _selectedLanguage = 'en-IN';
  String _speechText = '';
  bool _hasSpeech = false;
  bool _isLoadingLanguage = true;
  bool _isInitializing = true;
  StreamSubscription<String>? _speechSubscription;
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _initSpeech();
    _loadSavedLanguage();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  Future<void> _initSpeech() async {
    _hasSpeech = await _speechService.initialize();
    setState(() {
      _isInitializing = false;
    });
  }

  Future<void> _loadSavedLanguage() async {
    final savedLanguage = await _speechService.getSavedLanguage();

    setState(() {
      _selectedLanguage = savedLanguage ?? 'en-IN';
      _isLoadingLanguage = false;
    });
  }

  Future<void> _saveLanguage(String language) async {
    await _speechService.saveLanguage(language);
    setState(() {
      _selectedLanguage = language;
    });
  }

  Future<void> _startListening() async {
    if (_isInitializing) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Initializing speech recognition...')),
      );
      return;
    }

    if (!_hasSpeech) {
      // Try to initialize again
      _hasSpeech = await _speechService.initialize();
      if (!_hasSpeech) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Speech recognition not available')),
        );
        return;
      }
    }

    if (_isLoadingLanguage) {
      await _loadSavedLanguage();
    }

    await _speechSubscription?.cancel();
    _speechSubscription = null;

    setState(() {
      _isListening = true;
      _speechText = '';
    });

    _speechSubscription = _speechService
        .startListening(
          localeId: _selectedLanguage,
          listenFor: const Duration(minutes: 2),
          pauseFor: const Duration(seconds: 5),
          onError: (error) {
            setState(() {
              _isListening = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Speech recognition error: $error')),
            );
          },
        )
        .listen((result) {
          setState(() {
            _speechText = result;
          });
        });
  }

  Future<void> _stopListening() async {
    await _speechSubscription?.cancel();
    _speechSubscription = null;
    await _speechService.stopListening();
    setState(() {
      _isListening = false;
      if (_speechText.isNotEmpty) {
        // If the field expects numbers, try to convert spoken words to digits.
        if (widget.keyboardType == TextInputType.number) {
          final numeric = _convertSpeechToNumberString(_speechText);
          if (numeric.isNotEmpty) {
            widget.controller.text = numeric;
            widget.onTextChanged?.call(numeric);
          } else {
            // As a fallback, keep only digits from the speech text.
            final onlyDigits = _speechText.replaceAll(RegExp(r'[^0-9]'), '');
            widget.controller.text = onlyDigits;
            widget.onTextChanged?.call(onlyDigits);
          }
        } else {
          // Process text to convert spoken "at" to @ symbol for email fields
          if (widget.keyboardType == TextInputType.emailAddress) {
            final processedText = _convertSpeechToText(_speechText);
            widget.controller.text = processedText;
            widget.onTextChanged?.call(processedText);
          } else {
            widget.controller.text = _speechText;
            widget.onTextChanged?.call(_speechText);
          }
        }
      }
    });
  }

  // Attempts to convert spoken number words to a numeric string.
  // Supports common English forms like:
  //  - "one two three" -> "123"
  //  - "twenty three" -> "23"
  //  - "one hundred and five" -> "105"
  //  - "two thousand three hundred" -> "2300"
  //  - "minus forty two point five" -> "-42.5"
  //  - Handles Indian scales: lakh (1e5), crore (1e7)
  String _convertSpeechToNumberString(String input) {
    if (input.trim().isEmpty) return '';

    final lower = input.toLowerCase().trim();
    
    // Convert Devanagari numerals to Arabic numerals
    final processedInput = _convertDevanagariNumerals(lower);

    // If there are obvious numeric segments, prefer them first.
    final numMatches = RegExp(r'[+-]?\d+(?:[\.,]\d+)?').allMatches(processedInput);
    if (numMatches.isNotEmpty) {
      // Join contiguous numeric parts if separated by spaces or text.
      final joined = numMatches.map((m) => m.group(0)!).join('');
      // Normalize comma decimal to dot.
      return joined.replaceAll(',', '.');
    }

    // Tokenize words, splitting on whitespace and hyphens/commas.
    final rawTokens = processedInput
        .replaceAll(RegExp(r'[,-]'), ' ') // treat commas/hyphens as spaces
        .split(RegExp(r'\s+'))
        .where((t) => t.isNotEmpty)
        .toList();

    // Mapping for base numbers and tens (English + Hindi)
    const base = {
      // English numbers
      'zero': 0,
      'one': 1,
      'two': 2,
      'three': 3,
      'four': 4,
      'five': 5,
      'six': 6,
      'seven': 7,
      'eight': 8,
      'nine': 9,
      'ten': 10,
      'eleven': 11,
      'twelve': 12,
      'thirteen': 13,
      'fourteen': 14,
      'fifteen': 15,
      'sixteen': 16,
      'seventeen': 17,
      'eighteen': 18,
      'nineteen': 19,
      // Hindi numbers (0-19) - Romanized
      'shunya': 0,
      'ek': 1,
      'do': 2,
      'teen': 3,
      'char': 4,
      'paanch': 5,
      'panch': 5,
      'che': 6,
      'chhe': 6,
      'saat': 7,
      'aath': 8,
      'nau': 9,
      'das': 10,
      'gyarah': 11,
      'barah': 12,
      'terah': 13,
      'chaudah': 14,
      'pandrah': 15,
      'solah': 16,
      'satrah': 17,
      'atharah': 18,
      'unnis': 19,
      // Hindi numbers (0-19) - Devanagari script
      'शून्य': 0,
      'एक': 1,
      'दो': 2,
      'तीन': 3,
      'चार': 4,
      'पाँच': 5,
      'पांच': 5,
      'छह': 6,
      'छे': 6,
      'सात': 7,
      'आठ': 8,
      'नौ': 9,
      'दस': 10,
      'ग्यारह': 11,
      'बारह': 12,
      'तेरह': 13,
      'चौदह': 14,
      'पंद्रह': 15,
      'सोलह': 16,
      'सत्रह': 17,
      'अठारह': 18,
      'उन्नीस': 19,
      // Common compound Hindi numbers (20-99)
      'ikkis': 21,
      'bais': 22,
      'teis': 23,
      'chaubis': 24,
      'paccis': 25,
      'chabbis': 26,
      'sattais': 27,
      'atthais': 28,
      'untees': 29,
      'ektis': 31,
      'battis': 32,
      'tentis': 33,
      'chauntis': 34,
      'paintis': 35,
      'chhatees': 36,
      'saintees': 37,
      'artees': 38,
      'untalis': 39,
      'iktalis': 41,
      'bayalis': 42,
      'tetalis': 43,
      'chaualis': 44,
      'paintalis': 45,
      'chiyalis': 46,
      'saintalis': 47,
      'artalis': 48,
      'unchaas': 49,
      'ikyavan': 51,
      'bavan': 52,
      'tirpan': 53,
      'chauvan': 54,
      'pachpan': 55,
      'chappan': 56,
      'sattavan': 57,
      'athavan': 58,
      'unsaath': 59,
      'iksaath': 61,
      'basaath': 62,
      'tirsaath': 63,
      'chausaath': 64,
      'painsaath': 65,
      'chiyasaath': 66,
      'sarsaath': 67,
      'arsaath': 68,
      'unahatar': 69,
      'ikhattar': 71,
      'bahattar': 72,
      'tihattar': 73,
      'chauhattar': 74,
      'pachhattar': 75,
      'chiyhattar': 76,
      'satahattar': 77,
      'athhattar': 78,
      'unasi': 79,
      'ikiasi': 81,
      'bayasi': 82,
      'tirasi': 83,
      'chaurasi': 84,
      'pachasi': 85,
      'chiyasi': 86,
      'satasi': 87,
      'athasi': 88,
      'navasi': 89,
      'ikiyanve': 91,
      'bayanve': 92,
      'tiryanve': 93,
      'chauranve': 94,
      'pachyanve': 95,
      'chiyyanve': 96,
      'satayanve': 97,
      'athayanve': 98,
      'ninyanve': 99,
      // Key Devanagari compound numbers
      'बीस': 20,
      'इक्कीस': 21,
      'बाईस': 22,
      'तेईस': 23,
      'चौबीस': 24,
      'पच्चीस': 25,
      'छब्बीस': 26,
      'सत्ताईस': 27,
      'अट्ठाईस': 28,
      'उनतीस': 29,
      'तीस': 30,
      'इकतीस': 31,
      'बत्तीस': 32,
      'तैंतीस': 33,
      'चौंतीस': 34,
      'पैंतीस': 35,
      'छत्तीस': 36,
      'सैंतीस': 37,
      'अड़तीस': 38,
      'उनतालीस': 39,
      'चालीस': 40,
      'इकतालीस': 41,
      'बयालीस': 42,
      'तैंतालीस': 43,
      'चौवालीस': 44,
      'पैंतालीस': 45,
      'छियालीस': 46,
      'सैंतालीस': 47,
      'अड़तालीस': 48,
      'उनचास': 49,
      'पचास': 50,
      'पचपन': 55,
      'साठ': 60,
      'पैंसठ': 65,
      'सत्तर': 70,
      'पचहत्तर': 75,
      'अस्सी': 80,
      'पचासी': 85,
      'नब्बे': 90,
      'पचानवे': 95,
      'निन्यानवे': 99,
    };

    const tens = {
      // English tens
      'twenty': 20,
      'thirty': 30,
      'forty': 40,
      'fifty': 50,
      'sixty': 60,
      'seventy': 70,
      'eighty': 80,
      'ninety': 90,
      // Hindi tens - Romanized
      'bees': 20,
      'tees': 30,
      'chalis': 40,
      'pachaas': 50,
      'saath': 60,
      'sattar': 70,
      'assi': 80,
      'nabbe': 90,
      // Hindi tens - Devanagari
      'बीस': 20,
      'तीस': 30,
      'चालीस': 40,
      'पचास': 50,
      'साठ': 60,
      'सत्तर': 70,
      'अस्सी': 80,
      'नब्बे': 90,
    };

    const scales = {
      // English scales
      'hundred': 100,
      'thousand': 1000,
      'lakh': 100000, // Indian numbering
      'lac': 100000, // alternate spelling
      'crore': 10000000, // Indian numbering
      'million': 1000000,
      'billion': 1000000000,
      // Hindi scales - Romanized
      'sau': 100, // hundred in Hindi
      'hazar': 1000, // thousand in Hindi
      'hazaar': 1000, // alternate spelling
      'karod': 10000000, // crore in Hindi
      'karore': 10000000, // alternate spelling
      // Hindi scales - Devanagari
      'सौ': 100, // hundred in Devanagari
      'हजार': 1000, // thousand in Devanagari
      'हज़ार': 1000, // alternate spelling
      'लाख': 100000, // lakh in Devanagari
      'करोड़': 10000000, // crore in Devanagari
    };

    // Special tokens to ignore
    const ignore = {
      'and', 'rupees', 'rs', 'only', 'aur', 'sirf', 'bas', 'rupaye', 'rupaiye',
      'और', 'सिर्फ', 'बस', 'रुपये', 'रुपए', 'केवल'
    };

    // Handle sign
    int sign = 1;
    int idx = 0;
    if (rawTokens.isNotEmpty) {
      final first = rawTokens.first;
      if (first == 'minus' || first == 'negative') {
        sign = -1;
        idx = 1;
      } else if (first == '+') {
        sign = 1;
        idx = 1;
      }
    }

    int total = 0;
    int current = 0;
    bool sawNumberWord = false;
    bool decimalMode = false;
    final decimalDigits = StringBuffer();

    String? mapDigitWordToChar(String w) {
      if (base.containsKey(w)) return base[w]!.toString();
      // In decimal mode people often say letters for digits; keep it simple
      if (w.length == 1 && RegExp(r'\d').hasMatch(w)) return w;
      return null;
    }

    while (idx < rawTokens.length) {
      final w = rawTokens[idx];
      idx++;

      if (w == 'point' || w == 'dot' || w == 'decimal') {
        decimalMode = true;
        // Collect subsequent digits/words as fractional part
        while (idx < rawTokens.length) {
          final fw = rawTokens[idx];
          idx++;
          if (ignore.contains(fw)) continue;
          if (fw == 'minus' || fw == 'negative' || fw == 'plus' || fw == '+') break;
          final mapped = mapDigitWordToChar(fw);
          if (mapped != null) {
            decimalDigits.write(mapped);
          } else if (RegExp(r'^\d+$').hasMatch(fw)) {
            decimalDigits.write(fw);
          } else if (tens.containsKey(fw)) {
            // e.g., "point twenty three" -> 23
            final t = tens[fw]!;
            if (t >= 20 && t % 10 == 0) {
              decimalDigits.write((t ~/ 10).toString());
            }
          } else {
            // stop on unknown word in decimal part
            break;
          }
        }
        break; // decimal handled at the end
      }

      if (ignore.contains(w)) continue;

      if (base.containsKey(w)) {
        current += base[w]!;
        sawNumberWord = true;
        continue;
      }
      if (tens.containsKey(w)) {
        current += tens[w]!;
        sawNumberWord = true;
        continue;
      }
      if (w == 'hundred') {
        if (current == 0) current = 1; // "hundred" -> 100
        current *= 100;
        sawNumberWord = true;
        continue;
      }
      if (scales.containsKey(w)) {
        final scale = scales[w]!;
        if (current == 0) current = 1; // "thousand" -> 1000
        total += current * scale;
        current = 0;
        sawNumberWord = true;
        continue;
      }

      // If token is numeric digits, incorporate it directly
      if (RegExp(r'^\d+$').hasMatch(w)) {
        // If we already have some magnitude accumulated, shift accordingly.
        // E.g., "one two three" -> treat as sequential digits "123"
        // We'll handle this pattern separately after the loop if needed.
        // For now, mark that we saw digits and continue.
        current = current * 10 + int.parse(w);
        sawNumberWord = true;
        continue;
      }

      // Unknown word -> skip
    }

    // Build integer part
    final integerPart = sign * (total + current);

    // For numeric keyboard (digits only), always return integer part.
    if (!decimalMode) {
      // Handle pattern like "one two three" -> sequential digits 123
      // If the input is entirely small number words and spaces, try the digit-join approach.
      final sequentialDigits = _mapSequentialDigitWordsToDigits(rawTokens);
      if (sequentialDigits.isNotEmpty) {
        return (sign < 0 ? '-' : '') + sequentialDigits;
      }
      if (sawNumberWord) {
        return integerPart.toString();
      }
      return '';
    }

    // Decimal present: ignore fractional part for TextInputType.number.
    return integerPart.toString();
  }

  String _mapSequentialDigitWordsToDigits(List<String> tokens) {
    const digitWords = {
      // English digit words
      'zero': '0',
      'oh': '0', // sometimes recognized as "oh"
      'o': '0',
      'one': '1',
      'two': '2',
      'three': '3',
      'four': '4',
      'for': '4', // common homophone
      'five': '5',
      'six': '6',
      'seven': '7',
      'eight': '8',
      'ate': '8', // homophone
      'nine': '9',
      // Hindi digit words - Romanized
      'shunya': '0',
      'ek': '1',
      'do': '2',
      'teen': '3',
      'char': '4',
      'paanch': '5',
      'panch': '5',
      'che': '6',
      'chhe': '6',
      'saat': '7',
      'aath': '8',
      'nau': '9',
      // Hindi digit words - Devanagari
      'शून्य': '0',
      'एक': '1',
      'दो': '2',
      'तीन': '3',
      'चार': '4',
      'पाँच': '5',
      'पांच': '5',
      'छह': '6',
      'छे': '6',
      'सात': '7',
      'आठ': '8',
      'नौ': '9',
    };

    final buf = StringBuffer();
    bool any = false;
    for (final t in tokens) {
      final mapped = digitWords[t];
      if (mapped != null) {
        buf.write(mapped);
        any = true;
      } else if (RegExp(r'^\d$').hasMatch(t)) {
        buf.write(t);
        any = true;
      } else if (t == 'and' || t == 'to' || t == '-' || t == 'aur' || t == 'और') {
        continue;
      } else {
        // If it's an unknown token, bail out to avoid false positives.
        return '';
      }
    }
    return any ? buf.toString() : '';
  }

  // Helper method to convert Devanagari numerals to Arabic numerals
  String _convertDevanagariNumerals(String input) {
    const devanagariToArabic = {
      '०': '0',
      '१': '1',
      '२': '2',
      '३': '3',
      '४': '4',
      '५': '5',
      '६': '6',
      '७': '7',
      '८': '8',
      '९': '9',
    };
    
    String result = input;
    devanagariToArabic.forEach((devanagari, arabic) {
      result = result.replaceAll(devanagari, arabic);
    });
    
    return result;
  }

  // Helper method to convert spoken "at" to @ symbol for email fields
  String _convertSpeechToText(String input) {
    if (input.trim().isEmpty) return '';
    
    final lower = input.toLowerCase();
    
    // Replace common spoken versions of "at" with @ symbol
    return lower
        .replaceAll(RegExp(r'\bat\b'), '@')  // English "at"
        .replaceAll(RegExp(r'\bऐट\b'), '@')  // Hindi "aṭ" (Devanagari)
        .replaceAll(RegExp(r'\bएट\b'), '@')  // Hindi "eṭ" (Devanagari)
        .replaceAll(RegExp(r'\bऐट\b'), '@'); // Another Hindi variant
  }

  Future<void> _showLanguageSelector() async {
    final selectedLanguage = await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select Language'),
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
                return ListTile(
                  title: Text(languageName!),
                  trailing: languageCode == _selectedLanguage
                      ? const Icon(Icons.check, color: Colors.green)
                      : null,
                  onTap: () {
                    Navigator.of(context).pop(languageCode);
                  },
                );
              },
            ),
          ),
        );
      },
    );

    if (selectedLanguage != null) {
      await _saveLanguage(selectedLanguage);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.showTextField) {
      // Show only the voice input button
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.showLanguageSelector)
            IconButton(
              icon: const Icon(Icons.language),
              onPressed: _showLanguageSelector,
              tooltip: 'Change language',
            ),
          IconButton(
            icon: _isInitializing
                ? const Icon(Icons.hourglass_empty, size: 20)
                : Icon(_isListening ? Icons.mic : Icons.mic_none),
            onPressed: _isInitializing
                ? null
                : (_isListening ? _stopListening : _startListening),
            tooltip: _isInitializing
                ? 'Initializing...'
                : _isListening
                ? 'Stop listening'
                : 'Start voice input',
            color: _isListening
                ? Colors.red
                : (_isInitializing ? Colors.grey : null),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          inputFormatters: widget.keyboardType == TextInputType.number
              ? [SignedNumberFormatter()]
              : [],
          controller: widget.controller,
          maxLines: widget.maxLines,
          keyboardType: widget.keyboardType == TextInputType.number ? TextInputType.numberWithOptions(decimal: true, signed: true) : widget.keyboardType,
          readOnly: widget.readOnly,
          focusNode: _focusNode,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontSize: 15,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            suffixIcon: (widget.showMicAlways || _isFocused) ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.showLanguageSelector)
                  IconButton(
                    icon: const Icon(Icons.language),
                    onPressed: _showLanguageSelector,
                    tooltip: 'Change language',
                  ),
                IconButton(
                  icon: _isInitializing
                      ? const Icon(Icons.hourglass_empty, size: 20)
                      : Icon(_isListening ? Icons.mic : Icons.mic_none),
                  onPressed: _isInitializing
                      ? null
                      : (_isListening ? _stopListening : _startListening),
                  tooltip: _isInitializing
                      ? 'Initializing...'
                      : _isListening
                      ? 'Stop listening'
                      : 'Start voice input',
                  color: _isListening
                      ? Colors.red
                      : (_isInitializing ? Colors.grey : null),
                ),
              ],
            ) : null,
          ),
        ),
        if (_isListening)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              _speechText.isEmpty ? 'Listening...' : _speechText,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
            ),
          ),
        if (widget.showLanguageSelector && !_isLoadingLanguage)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              'Language: ${_speechService.indianLanguages[_selectedLanguage]}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _speechSubscription?.cancel();
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }
}
