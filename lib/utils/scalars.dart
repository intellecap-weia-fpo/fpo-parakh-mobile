import 'package:flutter/foundation.dart';

DateTime? dateFromJson(String? value) {
  if (value == null || value.isEmpty) return null;
  // Accept both full ISO8601 and date-only forms
  try {
    return DateTime.parse(value).toLocal();
  } catch (_) {
    return null;
  }
}

String? dateToJson(DateTime? value) {
  if (value == null) return null;
  // Ensure we only send date component in UTC-equivalent date.
  final d = DateTime(value.year, value.month, value.day);
  String two(int n) => n.toString().padLeft(2, '0');
  return '${d.year}-${two(d.month)}-${two(d.day)}';
}

@immutable
class CalendarDate implements Comparable<CalendarDate> {
  final int year;
  final int month;
  final int day;

  CalendarDate(this.year, this.month, this.day)
      : assert(month >= 1 && month <= 12, 'Month must be 1–12'),
        assert(day >= 1 && day <= _daysInMonth(year, month),
        'Day outside valid range for month.');

  /// Construct from the system [DateTime] (discarding the time portion).
  factory CalendarDate.fromDateTime(DateTime dt) =>
      CalendarDate(dt.year, dt.month, dt.day);

  /// Current date in the local time zone.
  factory CalendarDate.today() => CalendarDate.fromDateTime(DateTime.now());

  /// Parse ISO-8601 extended calendar date: `yyyy-MM-dd`
  factory CalendarDate.parse(String dmy) {
    final m = RegExp(r'^(\d{2})/(\d{2})/(\d{4})$').firstMatch(dmy);
    if (m == null) throw FormatException('Invalid d/M/y date: $dmy');
    final day   = int.parse(m[1]!);
    final month = int.parse(m[2]!);
    final year  = int.parse(m[3]!);
    return CalendarDate(year, month, day);
  }

  //--------------------------------------------------------------------
  // helpers
  static int _daysInMonth(int y, int m) => DateTime(y, m + 1, 0).day;

  /// Leap year test (proleptic Gregorian calendar).
  static bool _isLeapYear(int y) =>
      (y % 4 == 0) && (y % 100 != 0 || y % 400 == 0);

  //--------------------------------------------------------------------
  // value semantics
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CalendarDate &&
              year == other.year &&
              month == other.month &&
              day == other.day;

  @override
  int get hashCode => Object.hash(year, month, day);

  //--------------------------------------------------------------------
  // comparison
  @override
  int compareTo(CalendarDate other) {
    var c = year.compareTo(other.year);
    if (c != 0) return c;
    c = month.compareTo(other.month);
    if (c != 0) return c;
    return day.compareTo(other.day);
  }

  bool operator <(CalendarDate other) => compareTo(other) < 0;
  bool operator <=(CalendarDate other) => compareTo(other) <= 0;
  bool operator >(CalendarDate other) => compareTo(other) > 0;
  bool operator >=(CalendarDate other) => compareTo(other) >= 0;

  //--------------------------------------------------------------------
  // arithmetic
  /// Add [days]; negative value subtracts.
  CalendarDate addDays(int days) {
    if (days == 0) return this;
    final dt = DateTime(year, month, day).add(Duration(days: days));
    return CalendarDate.fromDateTime(dt);
  }

  /// Add [months] (day-of-month is pinned to last day of target month).
  CalendarDate addMonths(int months) {
    if (months == 0) return this;
    // Truncate to last valid day of target month.
    var newMonth = month + months;
    var newYear = year;
    while (newMonth > 12) {
      newMonth -= 12;
      newYear += 1;
    }
    while (newMonth < 1) {
      newMonth += 12;
      newYear -= 1;
    }
    final maxDay = _daysInMonth(newYear, newMonth);
    return CalendarDate(newYear, newMonth, day > maxDay ? maxDay : day);
  }

  /// Convert to `DateTime` at midnight.
  /// Set [utc] to true if you want midnight UTC instead of local.
  DateTime toDate({bool utc = false}) => utc
      ? DateTime.utc(year, month, day)
      : DateTime(year, month, day);

  //--------------------------------------------------------------------
  // output
  /// ISO-8601 extended format: yyyy-MM-dd
  @override
  String toString() =>
      [year.toString().padLeft(4, '0'), month.toString().padLeft(2, '0'), day.toString().padLeft(2, '0')].join('-');

  dynamic toJson() => toString();   // or just the string
}
