import 'package:desktop_base/features/about/about_page.dart';
import 'package:desktop_base/features/home/home_page.dart';
import 'package:desktop_base/features/transaction/out/form/transaction_out_form.dart';
import 'package:desktop_base/features/customer/list/list_customer_page.dart';
import 'package:flutter/material.dart';


Widget homeRoute(String? url) {
  switch (url) {
    case HomePage.route:
      return const HomePage();
    default:
      return const HomePage();
  }
}


