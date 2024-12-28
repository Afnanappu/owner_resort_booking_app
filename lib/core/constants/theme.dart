import 'package:flutter/material.dart';
import 'package:owner_resort_booking_app/core/constants/my_constants.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'my_colors.dart';

final ThemeData customTheme = ThemeData(
  // Primary and Secondary Colors
  // colorScheme: ColorScheme.fromSwatch(
  //   primarySwatch: Colors.deepOrange,
  //   accentColor: MyColors.orangeLight,
  //   backgroundColor: MyColors.orangeBackground,
  //   errorColor: MyColors.error,
  // ).copyWith(
  //   secondary: MyColors.orangeLight, // For accent
  // ),

  // scaffoldBackgroundColor: MyColors.scaffoldDefaultColor,

  // Text Theme
  // textTheme: TextTheme(
  //   bodyLarge: MyTextStyles.bodyLargeNormalWhite, // For large body text
  //   bodyMedium: MyTextStyles.textFieldNormalGreyLight, // For medium body text
  //   headlineSmall:
  //       MyTextStyles.headlineSmallSemiBoldBlack, // For small headline
  //   titleLarge: MyTextStyles.titleLargeSemiBoldBlack, // For title
  //   labelSmall: MyTextStyles.bodySmallMediumGreyLight, // For captions
  // ),
  // Button Theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      iconColor: MyColors.white,
      backgroundColor: MyColors.orange, // Button background color
      foregroundColor: MyColors.white, // Button text color
      textStyle: MyTextStyles.bodyLargeNormalWhite, // Button text style
    ),
  ),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: MyColors.orange, // Text color
      textStyle: MyTextStyles.bodyLargeNormalWhite,
    ),
  ),

  // appBarTheme: AppBarTheme(
  //   backgroundColor: MyColors.scaffoldDefaultColor,

  // ),

  // Floating Action Button Theme
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: MyColors.orange,
    foregroundColor: MyColors.white,
  ),

  // Input Decoration Theme
  // inputDecorationTheme: InputDecorationTheme(
  //   filled: true,
  //   fillColor: MyColors.orangeBackground,
  //   border: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(8.0),
  //     borderSide: BorderSide(color: MyColors.orange),
  //   ),
  //   focusedBorder: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(borderRad10),
  //     borderSide: BorderSide(color: MyColors.orange, width: 1),
  //   ),
  //   errorBorder: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(borderRad10),
  //     borderSide: BorderSide(color: MyColors.error, width: 1),
  //   ),
  //   hintStyle: MyTextStyles.textFieldNormalGreyLight, // TextField hint style
  // ),
);
