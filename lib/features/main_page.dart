import 'package:desktop_base/app/app_constant.dart';
import 'package:desktop_base/features/about/about_page.dart';
import 'package:desktop_base/features/customer/customer_routes.dart';
import 'package:desktop_base/features/home/home_routes.dart';
import 'package:desktop_base/features/product/product_routes.dart';
import 'package:desktop_base/features/transaction/transaction_page.dart';
import 'package:desktop_base/features/transaction/transaction_routes.dart';
import 'package:desktop_base/helper/base_navigator.dart';
import 'package:desktop_base/themes/app_colors.dart';
import 'package:desktop_base/themes/app_style.dart';
import 'package:desktop_base/themes/app_theme.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          (context.isDarkMode()) ? AppColors.baseDark : AppColors.baseLight,
      body: NavigationView(
        appBar: NavigationAppBar(
          title: Text(
            AppConst.appName,
            style: AppStyle.title4,
          ),
          automaticallyImplyLeading: true,
          leading: Container(),
        ),
        pane: NavigationPane(
          selected: _currentIndex,
          onChanged: (i) => setState(() => _currentIndex = i),
          // displayMode: _buildPaneStyle(),
          displayMode: PaneDisplayMode.top,
          indicator: const EndNavigationIndicator(),
          items: _buildPaneItem(),
        ),
        content: NavigationBody.builder(
          index: _currentIndex,
          itemCount: 4,
          itemBuilder: (context, index) {
            return NavigationBody(
              index: _currentIndex,
              children: _buildPages,
            );
          },
        ),
      ),
    );
  }

  PaneDisplayMode _buildPaneStyle() {
    var screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return PaneDisplayMode.top;
    } else if (screenWidth < 850) {
      return PaneDisplayMode.compact;
    } else {
      return PaneDisplayMode.open;
    }
  }

  List<NavigationPaneItem> _buildPaneItem() => [
        PaneItem(
          icon: const Icon(CupertinoIcons.rectangle_stack_person_crop),
          title: const Text('Customer'),
        ),
        PaneItem(
          icon: const Icon(FluentIcons.home),
          title: const Text('Home'),
        ),
        PaneItem(
          icon: const Icon(FluentIcons.shop),
          title: const Text('Product'),
          // infoBadge: const InfoBadge(
          //   source: Text('9'),
          // ),
        ),
        PaneItem(
          icon: const Icon(FluentIcons.add_to_shopping_list),
          title: const Text('Transaction'),
        ),
        PaneItem(
          icon: const Icon(FluentIcons.local_admin),
          title: const Text('About'),
        ),
      ];

  final List<Widget> _buildPages = [
    const BaseNavigator(pages: customerRoute),
    const BaseNavigator(pages: homeRoute),
    const BaseNavigator(pages: productRoute),
    const BaseNavigator(pages: transactionRoute),
    const AboutPage(),
  ];
}
