import 'package:desktop_base/widgets/content_wrapper.dart';
import 'package:flutter/material.dart';

class AddProductPage extends StatelessWidget {
  static const String route = '/add-product';
  const AddProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentWrapper(
      title: 'Tambah Produk',
      child: Column(
        children: [Text('Test')],
      ),
      // ),
    );
  }
}
