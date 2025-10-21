import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateExtentions on DateTime {

  String format() {
    final DateFormat customFormatter = DateFormat('yyyy/MM/dd');
    return customFormatter.format(this);
  }

  String formatMonth() {
    final DateFormat customFormatter = DateFormat('MMM');
    return customFormatter.format(this);
  }
}

extension TimeExtentions on TimeOfDay {
  DateTime toDateTime() {
    return DateTime(0, 0, 0, hour, minute);
  }
}