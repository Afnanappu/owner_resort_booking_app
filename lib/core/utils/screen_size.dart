import 'package:flutter/material.dart';

class MyScreenSize {
  static late double height;
  static late double width;
  static void initialize(BuildContext context) {
    height = MediaQuery.sizeOf(context).height;
    width = MediaQuery.sizeOf(context).width;
  }

  @override
  String toString() {
    return 'Screen(width: $width, height: $height)';
  }
}
