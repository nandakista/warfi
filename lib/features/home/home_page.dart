import 'package:desktop_base/features/home/component/header_card_component.dart';
import 'package:desktop_base/helper/date_time_helper.dart';
import 'package:desktop_base/themes/app_style.dart';
import 'package:desktop_base/widgets/basic_widget.dart';
import 'package:desktop_base/widgets/content_wrapper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String route = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentWrapper(
      title: 'Home',
      canBack: false,
      child: Column(
        children: [
          ..._buildHeader(),
        ],
      ),
    );
  }

  _buildHeader() {
    var dateNow = DateTime.now();
    return [
      Row(
        children: [
          HeaderCardComponent(
            title: '266',
            subtitle: 'Total Produk',
            updateTitle: 1,
            dateUpdate: dateNow,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            backgroundColor: Colors.green,
          ),
          const HeaderCardComponent(
              title: '266',
              subtitle: 'Nota',
              margin: EdgeInsets.symmetric(horizontal: 16),
          ),
        ],
      )
    ];
  }
}
