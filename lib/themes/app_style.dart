import 'package:desktop_base/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppStyle {
  static TextStyle title1 =
      const TextStyle(fontSize: 40, fontFamily: "Poppins");
  static TextStyle title2 =
      const TextStyle(fontSize: 34, fontFamily: "Poppins");
  static TextStyle title3 =
      const TextStyle(fontSize: 30, fontFamily: "Poppins");
  static TextStyle title4 =
      const TextStyle(fontSize: 28, fontFamily: "Poppins");

  static TextStyle subtitle1 =
      const TextStyle(fontSize: 24, fontFamily: "Poppins");
  static TextStyle subtitle2 =
      const TextStyle(fontSize: 20, fontFamily: "Poppins");
  static TextStyle subtitle3 =
      const TextStyle(fontSize: 18, fontFamily: "Poppins");
  static TextStyle subtitle4 =
      const TextStyle(fontSize: 16, fontFamily: "Poppins");

  static TextStyle normalSmall =
      const TextStyle(fontSize: 11, fontFamily: "Poppins",);

  static TextStyle headline1 = const TextStyle(
      fontSize: 34,
      fontWeight: FontWeight.w800,
      color: AppColors.primary,
      fontFamily: "Poppins");
  static TextStyle headline2 = const TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w800,
      color: AppColors.primary,
      fontFamily: "Poppins");
  static TextStyle headline3 = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: AppColors.primary,
      fontFamily: "Poppins");

  static TextStyle link = const TextStyle(
    fontSize: 18,
    color: Colors.blue,
    fontFamily: "Poppins",
  );

  // Font Weight
  static FontWeight superBold = FontWeight.w600;
  static FontWeight semiBold = FontWeight.w600;
  static FontWeight mediumWeight = FontWeight.w500;
  static FontWeight regularWeight = FontWeight.w400;
}
