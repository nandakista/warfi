import 'package:desktop_base/features/transaction/history_out/history_out_detail.dart';
import 'package:desktop_base/features/transaction/transaction/transaction_page.dart';
import 'package:flutter/material.dart';

Widget transactionRoute(String? url) {
  switch (url) {
    case TransactionPage.route:
      return const TransactionPage();
    case HistoryOutDetail.route:
      return const HistoryOutDetail();
    default:
      return const TransactionPage();
  }
}