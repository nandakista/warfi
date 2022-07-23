import 'package:desktop_base/features/customer/form/add_customer_page.dart';
import 'package:desktop_base/features/customer/list/list_customer_page.dart';
import 'package:flutter/material.dart';

Widget customerRoute(String? url) {
  switch (url) {
    case ListCustomerPage.route:
      return const ListCustomerPage();
    case AddCustomerPage.route:
      return const AddCustomerPage();
    default:
      return const ListCustomerPage();
  }
}
