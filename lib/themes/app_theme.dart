import 'package:desktop_base/themes/app_colors.dart';
import 'package:flutter/services.dart';
import 'package:fluent_ui/fluent_ui.dart' as fl;
import 'package:flutter/material.dart';


enum ThemeConf {
  LIGHT,
  DARK,
}

class AppTheme {
  static material({required ThemeConf theme}) {
    if(theme == ThemeConf.LIGHT) {
      return ThemeData(
        primaryColor: AppColors.materialPrimary,
        primarySwatch: AppColors.materialPrimary,
        accentColor: AppColors.secondary,
        fontFamily: "Poppins",
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            systemNavigationBarColor: Colors.black,
            statusBarColor: AppColors.primary,
          ),
        ),
      );
    } else {
      return ThemeData(
        primaryColor: AppColors.materialPrimary,
        primarySwatch: AppColors.materialPrimary,
        accentColor: AppColors.secondary,
        fontFamily: "Poppins",
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            systemNavigationBarColor: Colors.black,
            statusBarColor: AppColors.primary,
          ),
        ),
      );
    }
  }

  static fluent({required ThemeConf theme}) {
    if(theme == ThemeConf.LIGHT) {
      return fl.ThemeData(
        activeColor: AppColors.primary,
        accentColor: fl.Colors.blue,
        fontFamily: "Poppins",
        brightness: Brightness.light,
      );
    } else {
      return fl.ThemeData(
        activeColor: AppColors.primary,
        accentColor: fl.Colors.blue,
        fontFamily: "Poppins",
        brightness: Brightness.dark,
      );
    }
  }
}