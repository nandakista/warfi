import 'package:desktop_base/app/app_service.dart';
import 'package:desktop_base/database/data/account_data.dart';
import 'package:desktop_base/database/hive/dao/recap_dao.dart';
import 'package:desktop_base/database/hive/dao/transaction_dao.dart';
import 'package:desktop_base/database/hive/entity/customer/customer_entity.dart';
import 'package:desktop_base/database/hive/entity/product/product_entity.dart';
import 'package:desktop_base/database/hive/entity/recap/recap_entity.dart';
import 'package:desktop_base/database/hive/entity/transaction/transaction_entity.dart';
import 'package:desktop_base/features/customer/list/list_customer_page.dart';
import 'package:desktop_base/features/product/list_product/list_product_page.dart';
import 'package:desktop_base/features/transaction/transaction_page.dart';
import 'package:desktop_base/helper/dialog_helper.dart';
import 'package:flutter/material.dart';

class TransactionOutProvider with ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  final dao = locator<RecapDao>();
  final customerController = TextEditingController();
  final debtController = TextEditingController();
  final productController = TextEditingController();
  final noteController = TextEditingController();
  CustomerEntity? selectedCustomer;
  final List<ProductEntity> listProduct = [];
  List<TextEditingController> listDusController = [];
  List<TextEditingController> listBalController = [];
  List<TextEditingController> listPackController = [];
  List<TextEditingController> listPcsController = [];

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
        dao.add(RecapEntity(
          listProduct: listProduct,
          createdAt: DateTime.now(),
          account: admin,
          note: noteController.text,
          debt: int.tryParse(debtController.text) ?? 0,
          customer: selectedCustomer!,
        ));
        AppDialog.show(
          context: context,
          typeDialog: TypeDialog.SUCCESS,
          message: 'Berhasil membuat pengeluaran',
          onPress: () {
            AppDialog.close(context);
            onClose();
            Navigator.popAndPushNamed(context, TransactionPage.route);
          },
        );
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
    final result = await Navigator.pushNamed(
      context,
      ListCustomerPage.route,
      arguments: TransactionAction.PICK_ITEM,
    ) as CustomerEntity?;
    if (result != null) {
      customerController.text = result.name.toString();
      selectedCustomer = result;
    }
  }

  toAddProduct(BuildContext context) async {
    final result = await Navigator.pushNamed(context, ListProductPage.route,
        arguments: TransactionAction.PICK_ITEM) as ProductEntity?;
    if (result != null) {
      if (!listProduct.contains(result)) {
        listProduct.add(result);
        createProductControllers();
        notifyListeners();
      }
      for (int i = 0; i < listProduct.length; i++) {
        listProduct[i].pcs = 0;
        listProduct[i].dus = 0;
        listProduct[i].pack = 0;
        listProduct[i].bal = 0;
      }
    }
  }

  toRemoveProduct(ProductEntity item) async {
    listProduct.remove(item);
    notifyListeners();
  }

  createProductControllers() {
    listDusController =
        listProduct.map((e) => TextEditingController()).toList();
    listBalController =
        listProduct.map((e) => TextEditingController()).toList();
    listPackController =
        listProduct.map((e) => TextEditingController()).toList();
    listPcsController =
        listProduct.map((e) => TextEditingController()).toList();
  }

  int plusQuantity(TextEditingController controller) {
    int quantity = int.tryParse(controller.text) ?? 0;
    quantity++;
    controller.text = quantity.toString();
    return quantity;
  }

  int minusQuantity(TextEditingController controller) {
    int quantity = int.tryParse(controller.text) ?? 0;
    if (quantity > 0) {
      quantity--;
      if (quantity == 0) {
        controller.value = TextEditingValue.empty;
      } else {
        controller.text = quantity.toString();
      }
    }
    return quantity;
  }

  void onClose() {
    listDusController.clear();
    listBalController.clear();
    listPackController.clear();
    listPcsController.clear();

    customerController.clear();
    debtController.clear();
    productController.clear();
    noteController.clear();

    listProduct.clear();
    selectedCustomer = null;
  }
}

enum TransactionAction {
  PICK_ITEM,
}
