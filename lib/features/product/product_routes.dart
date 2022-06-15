import 'package:desktop_base/features/product/add_product/add_product_page.dart';
import 'package:desktop_base/features/product/list_product/list_product_page.dart';
import 'package:flutter/material.dart';

Widget productRoute(String? url) {
  switch (url) {
    case AddProductPage.route:
      return const AddProductPage();
    case ListProductPage.route:
      return const ListProductPage();
    default:
      return const ListProductPage();
  }
}