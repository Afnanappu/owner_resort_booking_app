import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/my_constants.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';

class CustomTextFormFieldAuth extends StatelessWidget {
  const CustomTextFormFieldAuth({
    super.key,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.keyboardType,
    this.vertical = 8,
    // this.horizontal = 20,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType? keyboardType;
  final double vertical;
  // final double horizontal;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical),
      child: TextFormField(
        controller: controller,
        cursorColor: MyColors.orangeLight,
        cursorHeight: 18,
        cursorRadius: Radius.circular(borderRad10),
        cursorOpacityAnimates: true,
        enableIMEPersonalizedLearning: true,
        enableInteractiveSelection: true,
        keyboardType: keyboardType,
        maxLines: 1,
        obscureText: obscureText,
        onTapOutside: (_) => FocusNode().unfocus(),
        validator: validator,
        style: MyTextStyles.textFieldNormalGreyLight,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          fillColor: MyColors.orangeBackground,
          filled: true,
          hintText: hintText,
          hintStyle: MyTextStyles.textFieldNormalGreyLight,
          prefixIcon: prefixIcon,
          prefixIconColor: MyColors.grey,
          suffixIcon: suffixIcon,
          suffixIconColor: MyColors.grey,
        ),
      ),
    );
  }
}
