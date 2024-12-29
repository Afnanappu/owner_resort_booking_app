import 'package:flutter/material.dart';

Future<TimeOfDay?> customTimePicker(
    {required BuildContext context, int? hour, int? minute}) {
  return showTimePicker(
    context: context,
    initialTime: TimeOfDay(
      hour: hour ?? TimeOfDay.now().hour,
      minute: minute ?? TimeOfDay.now().minute,
    ),
  );
}
