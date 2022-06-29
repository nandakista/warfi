import 'package:desktop_base/app/app_service.dart';
import 'package:desktop_base/database/drift/dao/product/product_dao.dart';
import 'package:desktop_base/database/drift/dao/transaction/transaction_dao.dart';
import 'package:desktop_base/database/drift/app_database.dart';
import 'package:desktop_base/helper/converter_helper.dart';
import 'package:desktop_base/helper/date_time_helper.dart';
import 'package:desktop_base/helper/dialog_helper.dart';
import 'package:flutter/material.dart';

class AddProductProvider with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final boxController = TextEditingController();
  final pcsController = TextEditingController();
  final balController = TextEditingController();
  final packController = TextEditingController();

  bool validateField() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      return true;
    }
    return false;
  }

  Future<void> addProduct(BuildContext context) async {
    if (validateField()) {
      try {
        final list = await locator<ProductDao>().getAllProduct();
        if (list.isNotEmpty) {
          for (var p in list) {
            if (p.idName ==
                AppConverter.toSnakeCase(nameController.text.toLowerCase())) {
              updateProduct(product: p);
              insertTransaction();
            } else {
              insertProduct();
              insertTransaction();
            }
          }
        } else {
          insertProduct();
          insertTransaction();
        }
        AppDialog.show(
          context: context,
          typeDialog: TypeDialog.SUCCESS,
          message: 'Produk berhasil ditambahkan',
          onPress: () {
            AppDialog.close(context);
            onClose();
            Navigator.pop(context);
          },
        );
        notifyListeners();
      } catch (e) {
        AppDialog.show(
          context: context,
          typeDialog: TypeDialog.FAILED,
          message: 'Error : $e',
          onPress: () => AppDialog.close(context),
        );
      }
    }
  }

  updateProduct({required ProductEntityData product}) async {
    print('produk id : ${product.idName} == ${AppConverter.toSnakeCase(nameController.text.toLowerCase())}');
    await locator<ProductDao>().updateProduct(
      AppConverter.toSnakeCase(nameController.text.toLowerCase()),
      ProductEntityCompanion.insert(
        idName: AppConverter.toSnakeCase(nameController.text.toLowerCase()),
        name: nameController.text,
        price: AppConverter.fromIDR(amount: priceController.text),
        box: int.tryParse(boxController.text)! + product.box,
        bal: int.tryParse(balController.text)! + product.bal,
        pack: int.tryParse(packController.text)! + product.pack,
        pcs: int.tryParse(pcsController.text)! + product.pcs,
      ),
    );
  }

  insertProduct() async {
    await locator<ProductDao>().insertProduct(
      ProductEntityCompanion.insert(
        idName: AppConverter.toSnakeCase(nameController.text.toLowerCase()),
        name: nameController.text,
        price: AppConverter.fromIDR(amount: priceController.text),
        box: int.tryParse(boxController.text) ?? 0,
        bal: int.tryParse(balController.text) ?? 0,
        pack: int.tryParse(packController.text) ?? 0,
        pcs: int.tryParse(pcsController.text) ?? 0,
      ),
    );
  }

  insertTransaction() async {
    await locator<TransactionDao>()
        .createTransaction(TransactionEntityCompanion.insert(
      idName: AppConverter.toSnakeCase(nameController.text.toLowerCase()),
      createdAt: DateHelper(date: DateTime.now()).format().toString(),
      deletedAt: '-',
      name: nameController.text,
      price: AppConverter.fromIDR(amount: priceController.text),
      box: int.tryParse(boxController.text) ?? 0,
      bal: int.tryParse(balController.text) ?? 0,
      pack: int.tryParse(packController.text) ?? 0,
      pcs: int.tryParse(pcsController.text) ?? 0,
    ));
  }

  void onClose() {
    nameController.clear();
    priceController.clear();
    boxController.clear();
    balController.clear();
    packController.clear();
    pcsController.clear();
  }
}
