import 'package:desktop_base/features/transaction/form/out_product/transaction_out_provider.dart';
import 'package:desktop_base/widgets/content_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionOutForm extends StatelessWidget {
  static const String route = '/products/out';
  const TransactionOutForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TransactionOutProvider>(context, listen: false);
    return ContentWrapper(
        title: 'Tambah Penjualan/Pengeluaran',
        child: Form(
          key: provider.formKey,
      child: ListView(
        children: [

        ],
      ),
    ));
  }
}
