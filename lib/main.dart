import 'dart:io';

import 'package:desktop_base/app/app_config.dart';
import 'package:desktop_base/app/app_constant.dart';
import 'package:desktop_base/app/app_service.dart';
import 'package:desktop_base/database/hive/app_database.dart';
import 'package:desktop_base/database/hive/dao/product_dao.dart';
import 'package:desktop_base/database/hive/entity/product/product_entity.dart';
import 'package:desktop_base/features/customer/form/add_customer_provider.dart';
import 'package:desktop_base/features/main_page.dart';
import 'package:desktop_base/features/transaction/history/history_out/history_out_provider.dart';
import 'package:desktop_base/features/transaction/in/form/add_product_provider.dart';
import 'package:desktop_base/features/product/list_product/list_product_provider.dart';
import 'package:desktop_base/features/test_page.dart';
import 'package:desktop_base/features/transaction/out/form/transaction_out_provider.dart';
import 'package:desktop_base/features/transaction/history/history_in/history_in_provider.dart';
import 'package:desktop_base/features/customer/list/list_customer_provider.dart';
import 'package:desktop_base/helper/general_function.dart';
import 'package:desktop_base/helper/scroll_helper.dart';
import 'package:desktop_base/themes/app_theme.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DesktopWindow.setMinWindowSize(const Size(700, 600));
  HttpOverrides.global = MyHttpOverrides();
  await AppServices.init();
  await HiveDB.init();
  AppConfig.init(Flavors.PRODUCTION);
  runApp(const MyApp());
}

class MyApp extends fluent.StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        // Pemasukan Barang
        ChangeNotifierProvider(create: (context) => AddProductProvider()),
        ChangeNotifierProvider(create: (context) => ListProductProvider().init()),

        // History
        ChangeNotifierProvider(create: (context) => HistoryInProvider()),
        ChangeNotifierProvider(create: (context) => HistoryOutProvider()),

        // Pengeluaran
        ChangeNotifierProvider(create: (context) => TransactionOutProvider()),

        // Customer
        ChangeNotifierProvider(create: (context) => ListCustomerProvider().init()),
        ChangeNotifierProvider(create: (context) => AddCustomerProvider()),
      ],
        child: fluent.FluentApp(
          title: AppConst.appName,
          debugShowCheckedModeBanner: false,
          scrollBehavior: NoThumbScrollBehavior().copyWith(scrollbars: false),
          theme: AppTheme.fluent(theme: ThemeConf.LIGHT),
          darkTheme: AppTheme.fluent(theme: ThemeConf.DARK),
          themeMode: ThemeMode.system,
          home: const MainPage(),
          // home: TestPage(),
        )
    );
  }
}
