import 'package:desktop_base/widgets/content_wrapper.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentWrapper(
      title: 'Transaction',
      canBack: false,
      child: Center(
        child: Text('Transaction'),
      ),
    );
  }
}
