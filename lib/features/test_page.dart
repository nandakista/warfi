import 'package:desktop_base/app/app_service.dart';
import 'package:desktop_base/database/hive/dao/product_dao.dart';
import 'package:desktop_base/helper/converter_helper.dart';
import 'package:desktop_base/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              text: 'Convert',
              onPress: () {
                String a = "Rp 1.500";
                int b = 1500;
              },
            ),

            CustomButton(
              text: 'Delete DB',
              onPress: () {
                final box1 = Hive.box('transactionBox');
                final box = Hive.box('productBox');

                box.deleteFromDisk();
                box1.deleteFromDisk();
              },
            ),
          ],
        ),
      ),
    );
  }
}
