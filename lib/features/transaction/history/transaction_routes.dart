import 'package:desktop_base/features/transaction/history/history_out/history_out_detail_page.dart';
import 'package:desktop_base/features/transaction/history/transaction_page.dart';
import 'package:flutter/material.dart';

Widget transactionRoute(String? url) {
  switch (url) {
    case TransactionPage.route:
      return const TransactionPage();
    case HistoryOutDetailPage.route:
      return const HistoryOutDetailPage();
    default:
      return const TransactionPage();
  }
}