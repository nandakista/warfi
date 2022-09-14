import 'package:desktop_base/features/product/list_product/list_product_page.dart';
import 'package:desktop_base/features/transaction/history/history_out/history_out_detail_page.dart';
import 'package:desktop_base/features/transaction/out/form/transaction_out_form.dart';
import 'package:desktop_base/features/customer/list/list_customer_page.dart';
import 'package:desktop_base/features/transaction/transaction_page.dart';
import 'package:flutter/material.dart';

Widget transactionRoute(String? url) {
  switch (url) {
    case TransactionPage.route:
      return const TransactionPage();
    case TransactionOutForm.route:
      return const TransactionOutForm();
    case ListCustomerPage.route:
      return const ListCustomerPage();
    case ListProductPage.route:
      return const ListProductPage();
    case HistoryOutDetailPage.route:
      return const HistoryOutDetailPage();
    default:
      return const TransactionPage();
  }
}