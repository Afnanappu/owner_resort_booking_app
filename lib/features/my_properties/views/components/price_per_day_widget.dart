// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class PricePerDayWidget extends StatelessWidget {
  const PricePerDayWidget({
    super.key,
    required this.priceText,
    required this.priceStyle,
    required this.suffixStyle,
  });

  final String priceText;
  final TextStyle priceStyle;
  final TextStyle suffixStyle;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      style: priceStyle,
      TextSpan(
        text: priceText,
        children: [
          TextSpan(
            text: '/day',
            style:suffixStyle,
          ),
        ],
      ),
    );
  }
}
