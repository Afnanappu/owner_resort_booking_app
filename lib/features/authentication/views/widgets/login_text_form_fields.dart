import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/core/utils/custom_regex.dart';
import 'package:owner_resort_booking_app/features/authentication/views/components/custom_text_form_field_auth.dart';

class LoginTextFormFields extends StatelessWidget {
  const LoginTextFormFields({
    super.key,
    required this.emailController,
    required this.ownerIdController,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final TextEditingController emailController;
  final TextEditingController ownerIdController;
  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email',
            style: MyTextStyles.titleLargeSemiBoldBlack,
          ),
          CustomTextFormFieldAuth(
            validator: (value) {
              if (MyRegex.emailValidation(value)) {
                return 'Invalid email format';
              }
              return null;
            },
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icon(Icons.email_outlined),
            hintText: 'name@example.com',
          ),
          MySpaces.hSpace20,
          Text(
            'Owner ID',
            style: MyTextStyles.titleLargeSemiBoldBlack,
          ),
          CustomTextFormFieldAuth(
            validator: (value) {
              if (value == null || value.isEmpty || value.length != 10) {
                return 'Invalid Id';
              }
              return null;
            },
            controller: ownerIdController,
            keyboardType: TextInputType.visiblePassword,
            prefixIcon: Icon(Icons.password_outlined),
            hintText: 'unique id',
            suffixIcon: Icon(
              FontAwesomeIcons.eyeSlash,
              size: 18,
            ),
          ),
          MySpaces.hSpace5,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: MyColors.orange,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Text(
                    'Forgot Owner ID?',
                    style: TextStyle(
                      color: MyColors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
