import 'package:desktop_base/features/transaction/history_out/history_out_tab.dart';
import 'package:desktop_base/themes/app_colors.dart';
import 'package:desktop_base/themes/app_theme.dart';
import 'package:fluent_ui/fluent_ui.dart' as fl;
import 'package:flutter/material.dart';

import 'history_in/history_in_tab.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: (context.isDarkMode()) ? AppColors.baseDark : AppColors.baseLight,
        appBar: AppBar(
          bottom: const TabBar(
            indicatorColor: AppColors.primary,
            tabs: [
              Tab(icon: Icon(Icons.arrow_downward), text: 'Penambahan Produk'),
              Tab(icon: Icon(Icons.arrow_upward), text: 'Pengeluaran Produk'),
            ],
          ),
          title: const Text('Transaksi'),
        ),

        body: const TabBarView(
          children: [
            HistoryInTab(),
            HistoryOutTab(),
          ],
        ),
      ),
    );
  }
}
