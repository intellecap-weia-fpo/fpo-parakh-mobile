import 'package:flutter/services.dart';

class SignedNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;

    // Allow empty string or just a minus sign while typing
    if (text.isEmpty || text == '-') {
      return newValue;
    }

    // Allow starting decimal input such as "." or "-."
    if (text == '.' || text == '-.') {
      return newValue;
    }

    final validNumberPattern = RegExp(r'^-?\d*\.?\d+$');
    final integerPattern = RegExp(r'^-?\d+$');
    final trailingDotPattern = RegExp(r'^-?\d+\.$');

    // Reject if it doesn't match any acceptable pattern
    if (!validNumberPattern.hasMatch(text) &&
        !integerPattern.hasMatch(text) &&
        !trailingDotPattern.hasMatch(text)) {
      return oldValue;
    }

    // Ensure only one decimal point exists
    if ('.'.allMatches(text).length > 1) {
      return oldValue;
    }

    // Ensure negative sign only appears at the beginning
    if (text.contains('-') && text.indexOf('-') != 0) {
      return oldValue;
    }

    return newValue;
  }
}
