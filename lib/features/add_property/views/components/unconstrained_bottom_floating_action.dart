import 'package:flutter/material.dart';

class UnconstrainedBottomFloatingAction extends StatelessWidget {
  const UnconstrainedBottomFloatingAction({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: child,
      ),
    );
  }
}
