// ignore_for_file: unnecessary_lambdas

import 'package:intl/intl.dart';

extension DateTimeCoreX on DateTime? {
  String? get timeString {
    if (this == null) return null;
    return '${this!.hour.toString().padLeft(2, '0')}:${this!.minute.toString().padLeft(2, '0')}';
  }

  ///dd.MM.yyyy
  String? dateString([String? format]) {
    if (this == null) return null;
    return DateFormat(format ?? 'dd.MM.yyyy').format(this!);
  }

  DateTime? fromDateAndTime(String? date, String? time) {
    if (date == null || time == null) return null;
    final parts = date
        .split('-')
        .map(
          (e) => int.tryParse(e),
        )
        .toList();
    if (parts.length != 3) return null;

    final timeParts = time.split(':').map(
          (item) => int.tryParse(item),
        );
    if (timeParts.length < 2) {
      return null;
    }

    parts.addAll(timeParts);
    if (parts.any((item) => item == null)) {
      return null;
    }

    return DateTime(
      parts[0]!,
      parts[1]!,
      parts[2]!,
      parts[3]!,
      parts[4]!,
    );
  }

  int get daysInMonth {
    final now = DateTime.now();
    return DateTime(now.year, now.month + 1, 0).day;
  }

  int? get remainingSeconds {
    if (this == null) return null;
    return this!.difference(DateTime.now()).inSeconds.clamp(0, 100000000);
  }

  bool isSameDay(DateTime? other) {
    if (this == null || other == null) return false;
    return this!.day == other.day && this!.month == other.month && this!.year == other.year;
  }

  bool isDayBefore(DateTime? other) {
    if (this == null || other == null) return false;
    final prevDay = other.subtract(const Duration(days: 1));
    return prevDay.isSameDay(other);
  }
}
