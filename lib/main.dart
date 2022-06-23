import 'dart:io';

import 'package:desktop_base/app/app_config.dart';
import 'package:desktop_base/app/app_constant.dart';
import 'package:desktop_base/app/app_service.dart';
import 'package:desktop_base/features/main_page.dart';
import 'package:desktop_base/features/product/add_product/add_product_provider.dart';
import 'package:desktop_base/helper/general_function.dart';
import 'package:desktop_base/helper/scroll_helper.dart';
import 'package:desktop_base/themes/app_theme.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DesktopWindow.setMinWindowSize(const Size(550, 600));
  HttpOverrides.global = MyHttpOverrides();
  await AppServices.init();
  AppConfig.init(Flavors.PRODUCTION);
  runApp(const MyApp());
}

class MyApp extends fluent.StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AddProductProvider()),
      ],
        child: fluent.FluentApp(
          title: AppConst.appName,
          debugShowCheckedModeBanner: false,
          scrollBehavior: NoThumbScrollBehavior().copyWith(scrollbars: false),
          theme: AppTheme.fluent(theme: ThemeConf.LIGHT),
          darkTheme: AppTheme.fluent(theme: ThemeConf.DARK),
          themeMode: ThemeMode.system,
          home: const MainPage(),
        )
    );
  }
}
