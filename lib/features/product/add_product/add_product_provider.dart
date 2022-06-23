import 'package:desktop_base/app/app_service.dart';
import 'package:desktop_base/database/drift/drift_db.dart';
import 'package:desktop_base/helper/dialog_helper.dart';
import 'package:flutter/material.dart';

class AddProductProvider with ChangeNotifier {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final boxController = TextEditingController();
  final pcsController = TextEditingController();
  final balController = TextEditingController();
  final packController = TextEditingController();
  // String? result;

  addProduct(BuildContext context) async {
    Loading.show(context);
    try {
      await locator<AppDatabase>()
          .insertProduct(
        ProductEntityCompanion.insert(
          name: nameController.text,
          price: priceController.text,
          box: int.tryParse(boxController.text) ?? 0,
          bal: int.tryParse(balController.text) ?? 0,
          pack: int.tryParse(packController.text) ?? 0,
          pcs: int.tryParse(pcsController.text) ?? 0,
        ),
      )
          .then(
        (value) {
          Loading.hide(context);
          AppDialog.show(
            context: context,
            typeDialog: TypeDialog.SUCCESS,
            message: 'Produk berhasil ditambahkan',
            onPress: () {
              AppDialog.close(context);
            },
          );
        },
      );
      notifyListeners();
    } catch (e) {
      Loading.hide(context);
      AppDialog.show(
        context: context,
        typeDialog: TypeDialog.FAILED,
        message: 'Error : $e',
        onPress: () => AppDialog.close(context),
      );
    }
  }

  getProduct(BuildContext context) async {
    final allProduct = await locator<AppDatabase>().getAllProduct();
    print('All Product : $allProduct');
  }
}
