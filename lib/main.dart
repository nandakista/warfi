import 'dart:io';

import 'package:desktop_base/app/app_config.dart';
import 'package:desktop_base/app/app_constant.dart';
import 'package:desktop_base/app/app_services.dart';
import 'package:desktop_base/features/main_page.dart';
import 'package:desktop_base/helper/general_function.dart';
import 'package:desktop_base/themes/app_theme.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DesktopWindow.setMinWindowSize(const Size(550,600));
  HttpOverrides.global = MyHttpOverrides();
  await AppServices.init();
  await GetStorage.init();
  AppConfig.init(Flavors.PRODUCTION);
  runApp(const MyApp());
}

class MyApp extends fluent.StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.material(theme: ThemeConf.LIGHT),
      darkTheme: AppTheme.material(theme: ThemeConf.DARK),
      themeMode: ThemeMode.light,
      home: fluent.FluentApp(
        title: AppConst.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.fluent(theme: ThemeConf.LIGHT),
        darkTheme: AppTheme.fluent(theme: ThemeConf.DARK),
        themeMode: ThemeMode.light,
        home: const MainPage(),
      ),
    );
  }
}
