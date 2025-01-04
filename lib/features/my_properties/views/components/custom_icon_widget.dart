import 'package:flutter/material.dart';

class CustomIconTextWidget extends StatelessWidget {
  const CustomIconTextWidget({
    super.key,
    required this.icon,
    required this.content,
    this.gap = 5,
  });
  final Widget icon;
  final Widget content;
  final double gap;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: gap,
      children: [
        icon,
        content,
      ],
    );
  }
}
