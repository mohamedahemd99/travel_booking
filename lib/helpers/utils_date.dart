import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'preferences/pref_manager.dart';

class UtilsDate {
  static String getTimeFromDateText(String date) {
    try {
      var inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss', 'en');
      var inputDate = inputFormat.parse(date); //

      var outputFormat = DateFormat('hh:mm a', PrefManager.getLang());
      var outputTime = outputFormat.format(inputDate);

      return outputTime;
    } catch (e) {
      return '00:00';
    }
  }

  static String getTimeIn12h(String time) {
    try {
      var inputFormat = DateFormat('HH:mm', 'en');
      var inputDate = inputFormat.parse(time); //

      var outputFormat = DateFormat('hh:mm a', PrefManager.getLang());
      var outputTime = outputFormat.format(inputDate);

      return outputTime;
    } catch (e) {
      return '00:00';
    }
  }

  static bool isTimeAfterNow(String time) {
    try {
      var dateTime = getDateTimeFromStringTime(time);
      var now =
          getDateTimeFromStringTime(getStringTimeFromDateTime(DateTime.now()));
      return dateTime.isAfter(now) ? true : false;
    } catch (e) {
      return false;
    }
  }

  static DateTime getDateTimeFromStringDate(String date) {
    var format = DateFormat("yyyy-MM-dd", 'en');
    var dateTime = format.parse(date);
    return dateTime;
  }

  static DateTime getDateTimeFromStringTime(String time) {
    var format = DateFormat("HH:mm", 'en');
    var dateTime = format.parse(time);
    return dateTime;
  }

  static String getStringTimeFromDateTime(DateTime dateTime) {
    var dateFormat = DateFormat("HH:mm", 'en');
    final String textFormatted = dateFormat.format(dateTime);
    return textFormatted;
  }

  static String getStringDateFromDateTime(DateTime dateTime) {
    var dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss", 'en');
    final String textFormatted = dateFormat.format(dateTime);
    return textFormatted;
  }

  static DateTime getDateTimeFromStringWithFormat(String time, String format) {
    var dateFormat = DateFormat(format, 'en');
    var dateTime = dateFormat.parse(time);
    return dateTime;
  }

  static String getStringFromDateTimeWithFormat(
      DateTime dateTime, String format) {
    var dateFormat = DateFormat(format, 'en');
    final String textFormatted = dateFormat.format(dateTime);
    return textFormatted;
  }

  static int getMillisecondsBetween(String time) {
    try {
      String timeWithSeconds = "$time:00";
      String format = "HH:mm:ss";
      var dateTime = getDateTimeFromStringWithFormat(timeWithSeconds, format);
      var now = getDateTimeFromStringWithFormat(
          getStringFromDateTimeWithFormat(DateTime.now(), format), format);

      int differentMilliseconds = DateTime.now().millisecondsSinceEpoch +
          dateTime.difference(now).inMilliseconds;

      return differentMilliseconds;
    } catch (e) {
      return 0;
    }
  }

  static int getHoursBetweenNow(int milliseconds) {
    try {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(milliseconds);
      int hours = DateTime.now().difference(dateTime).inHours;
      return hours;
    } catch (e) {
      return 0;
    }
  }

  static String getFormattedDate(String isoDate) {
    try {
      DateTime dateTime = DateTime.parse(isoDate);
      String formattedDate =
          DateFormat('EEE d MMM yyyy', 'en').format(dateTime);
      return formattedDate;
    } catch (e) {
      return '';
    }
  }

  static String getDateFromDateTime(DateTime dateTime) {
    try {
      String formattedDate = DateFormat('yyyy-MM-dd', 'en').format(dateTime);
      return formattedDate;
    } catch (e) {
      return '';
    }
  }

  static String getDayMonthFromIso(String isoDate) {
    try {
      DateTime dateTime = DateTime.parse(isoDate);
      String formattedDate = DateFormat('dd MMM', 'en').format(dateTime);
      return formattedDate;
    } catch (e) {
      return '';
    }
  }

  static String getTimeFromIso(String isoDate) {
    try {
      DateTime dateTime = DateTime.parse(isoDate);
      String formattedDate = DateFormat('hh:mm a', 'en').format(dateTime);
      return formattedDate;
    } catch (e) {
      return '';
    }
  }
}

extension StringExtension on String {
  DateTime? get currentLocalDate {
    return toCurrentLocalDate();
  }

  DateTime? toCurrentLocalDate({String format = "yyyy-MM-ddTHH:mm:ss"}) {
    try {
      return this == "null" || isEmpty
          ? null
          : DateFormat(format, 'en').parse(this, true).toLocal();
    } catch (e) {
      debugPrint(
          "Eslam the error in parsing current string: $this, to current local date is: $e");
    }

    return null;
  }
}
