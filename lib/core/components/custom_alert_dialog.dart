import 'package:flutter/material.dart';

Future<dynamic> customAlertDialog({
  required BuildContext context,
  required String title,
  String? content,
  String? firstText,
  String? secondText,
  void Function()? firstOnPressed,
  void Function()? secondOnPressed,
}) {
  return showAdaptiveDialog(
    context: context,
    builder: (context) => AlertDialog.adaptive(
      title: Text(title),
      content: content != null ? Text(content) : null,
      actions: [
        if (firstText != null)
          TextButton(onPressed: firstOnPressed, child: Text(firstText)),
        if (secondText != null)
          TextButton(onPressed: secondOnPressed, child: Text(secondText)),
      ],
    ),
  );
}
