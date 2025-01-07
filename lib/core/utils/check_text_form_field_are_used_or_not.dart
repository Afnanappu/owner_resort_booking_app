import 'package:flutter/material.dart';


///True if any of the give controllers have any value
bool checkTextFormFieldAreUsedOrNot(List<TextEditingController> controllers) {
  return controllers.any((controller) => controller.text.isNotEmpty);
}
