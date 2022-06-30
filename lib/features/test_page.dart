import 'package:desktop_base/app/app_service.dart';
import 'package:desktop_base/database/hive/dao/product_dao.dart';
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
              text: 'Add Hive',
              onPress: () {
                final a = locator<ProductDao>();
                // a.add(entity);
              },
            ),
            CustomButton(
              text: 'Get Hive',
              onPress: () {
                final a = locator<ProductDao>();
                a.getAll();
              },
            ),
            CustomButton(
              text: 'Add or Update',
              onPress: () {
                final a = locator<ProductDao>();
                // a.addOrUpdate();
              },
            ),
            CustomButton(
              text: 'Delete',
              onPress: () {
                final a = locator<ProductDao>();
                a.deleteAll();
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
