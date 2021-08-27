import 'package:flutter/material.dart';

class GetTimePicker {
  GetTimePicker._privateConstructor();

  static final GetTimePicker _instance = GetTimePicker._privateConstructor();

  static GetTimePicker get getInstance => _instance;

  Future<DateTime?> showDateTimePicker({required BuildContext context}) async {
    final getDateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().add(Duration(days: -3)),
      lastDate: DateTime.now().add(Duration(days: 360)),
    );
    return getDateTime;
  }
}
