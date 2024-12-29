import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';

class CustomTextFormFieldForAddProperty extends StatelessWidget {
  const CustomTextFormFieldForAddProperty({
    super.key,
    required this.hintText,
    required this.controller,
    this.width,
    this.keyboardType,
    this.validator,
    this.suffixIcon,
    this.enabled = true,
    this.readOnly = false,
  });
  final double? width;
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool enabled;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        enabled: enabled,
        readOnly: readOnly,
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        onEditingComplete: () {
          FocusScope.of(context).nextFocus();
        },
        validator: validator,
        cursorColor: MyColors.grey,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: MyColors.grey,
              style: BorderStyle.solid,
              width: 5,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: MyColors.grey,
              style: BorderStyle.solid,
              width: 2,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: MyColors.orange,
              style: BorderStyle.solid,
              width: 2,
            ),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: MyColors.error,
              style: BorderStyle.solid,
              width: 5,
            ),
          ),
        ),
      ),
    );
  }
}
