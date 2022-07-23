import 'package:desktop_base/database/hive/entity/customer/customer_entity.dart';
import 'package:desktop_base/database/hive/entity/product/product_entity.dart';
import 'package:desktop_base/features/customer/list/list_customer_page.dart';
import 'package:desktop_base/helper/dialog_helper.dart';
import 'package:flutter/material.dart';

class TransactionOutProvider with ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  final customerController = TextEditingController();
  final debtController = TextEditingController();
  final productController = TextEditingController();
  final noteController = TextEditingController();
  CustomerEntity? selectedCustomer;
  final List<ProductEntity> listProduct = [];

  bool validateField() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      return true;
    }
    return false;
  }

  createTransaction(BuildContext context) async {
    if (listProduct.isNotEmpty && selectedCustomer != null) {
      try {
        // Do Something
      } catch (e) {
        AppDialog.show(
          context: context,
          typeDialog: TypeDialog.FAILED,
          message: 'Error : $e',
          onPress: () => AppDialog.close(context),
        );
      }
    } else {
      AppDialog.show(
          context: context,
          typeDialog: TypeDialog.FAILED,
          message: 'Semua kolom harus diisi',
          onPress: () => AppDialog.close(context));
    }
  }

  toPickCustomer(BuildContext context) async {
    // print('Pick Customer');
    // final result = Navigator.pushNamed(context, ListCustomerPage.route);
    return Navigator.pushNamed(context, ListCustomerPage.route);
  }
}
