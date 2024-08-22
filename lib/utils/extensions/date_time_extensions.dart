import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String get parseToYYYYMMDD {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  String get formatToDDMMYYYYHHmm {
    final dateFormat = DateFormat('dd.MM.yyyy HH:mm');
    return dateFormat.format(this);
  }

  String get formatToDDMMYY {
    var format = DateFormat('dd/MM/yy');
    return format.format(this);
  }

  String get formatToDDMMYYYY {
    var format = DateFormat('dd.MM.yyyy');
    return format.format(this);
  }

  String get formatToDDMMMMYYYY {
    var format = DateFormat('dd MMMM yyyy');
    return format.format(this);
  }

  String get formatToDDMMMYYYY {
    var format = DateFormat('dd MMM yyyy');
    return format.format(this);
  }

  String get formatToDDMMM {
    var format = DateFormat('dd MMM');
    return format.format(this);
  }

  String get formatToDDMMMM {
    var format = DateFormat('dd MMMM');
    return format.format(this);
  }

  String get formatToYMMMM {
    var format = DateFormat('yMMMM');
    return format.format(this);
  }

  String get formatToDD {
    var format = DateFormat('dd');
    return format.format(this);
  }

  String get formatToHHMM {
    var format = DateFormat('HH:mm');
    return format.format(this);
  }

  /// Returns the nights count between [startDate] and [expireDate].
  ///
  /// Example:
  /// ```dart
  /// departedAt.nightCount(arrivalAt)
  /// ```
  int nightCount(DateTime other) {
    var startDate = other;
    var endDate = this;
    var timeDiff =
        endDate.millisecondsSinceEpoch - startDate.millisecondsSinceEpoch;
    var nights = (timeDiff / (1000 * 3600 * 24)).ceil();
    return nights == 0 ? 1 : nights;
  }

  DateTime get getUTCDayStart {
    return DateTime.utc(
      year,
      month,
      day,
      0,
      0,
      0,
      0,
      0,
    );
  }

  DateTime get getTimeStartDay {
    return DateTime(
      year,
      month,
      day,
      0,
      0,
      0,
      0,
      0,
    );
  }

  DateTime get getTimeEndDay {
    return DateTime(
      year,
      month,
      day,
      23,
      59,
      59,
      999,
      999,
    );
  }

  DateTime get getTimeStartMonth {
    return DateTime(
      year,
      month,
      1,
      0,
      0,
      0,
      0,
      0,
    );
  }

  DateTime get getTimeEndMonth {
    return DateTime(
      year,
      month,
      DateUtils.getDaysInMonth(year, month),
      23,
      59,
      59,
      999,
      999,
    );
  }

  bool isBetween(
    DateTime? date1,
    DateTime? date2,
  ) {
    if (date1 == null || date2 == null) return false;
    return isAfter(date1) && isBefore(date2) ||
        isAtSameMomentAs(date1) ||
        isAtSameMomentAs(date2);
  }

  bool isAfterIncluded(
    DateTime? date,
  ) {
    if (date == null) return false;
    return isAfter(date) || isAtSameMomentAs(date);
  }

  bool isBeforeIncluded(
    DateTime? date,
  ) {
    if (date == null) return false;
    return isBefore(date) || isAtSameMomentAs(date);
  }

  int get getWeekOfYear {
    final date = this;
    final startOfYear = DateTime(date.year, 1, 1, 0, 0);
    final firstMonday = startOfYear.weekday;
    final daysInFirstWeek = 8 - firstMonday;
    final diff = date.difference(startOfYear);
    var weeks = ((diff.inDays - daysInFirstWeek) / 7).ceil();
    if (daysInFirstWeek > 3) {
      weeks += 1;
    }
    return weeks;
  }
}

extension DateTimeNullableExt on DateTime? {
  bool isAfterIncluded(DateTime? date) {
    if (date == null) return false;
    return this!.isAfter(date) || this!.isAtSameMomentAs(date);
  }

  bool isBeforeIncluded(DateTime? date) {
    if (date == null) return false;
    return this!.isBefore(date) || this!.isAtSameMomentAs(date);
  }
}
