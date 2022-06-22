import 'package:desktop_base/widgets/content_wrapper.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentWrapper(
      title: 'Transaction',
      canBack: false,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Flexible(
              child: Container(
                color: Colors.amber,
                width: MediaQuery.of(context).size.width,
                child: const Text('Product',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            Flexible(
              child: Container(
                color: Colors.blue,
                width: MediaQuery.of(context).size.width,
                child: Text('Harga',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            Flexible(
              child: Container(
                color: Colors.red,
                width: MediaQuery.of(context).size.width,
                child: Text('Kuantitas',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
