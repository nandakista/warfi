import 'package:desktop_base/app/app_service.dart';
import 'package:desktop_base/database/hive/dao/customer_dao.dart';
import 'package:desktop_base/database/hive/entity/customer/customer_entity.dart';
import 'package:desktop_base/features/customer/list/list_customer_provider.dart';
import 'package:desktop_base/helper/dialog_helper.dart';
import 'package:flutter/material.dart';

class AddCustomerProvider with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  int? indexId;

  initPage(CustomerAction action, int? index, CustomerEntity? entity){
    if(action == CustomerAction.UPDATE) {
      indexId = index;
      if(entity != null) {
        nameController.text = entity.name.toString();
        phoneController.text = entity.phone.toString();
        addressController.text = entity.address.toString();
      }
    }
  }

  bool validateField() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      return true;
    }
    return false;
  }

  addCustomer(BuildContext context) async {
    if (validateField()) {
      try {
        final customer = CustomerEntity(
          name: nameController.text,
          phone: phoneController.text,
          address: addressController.text,
        );
        locator<CustomerDao>().add(customer);
        AppDialog.show(
          context: context,
          typeDialog: TypeDialog.SUCCESS,
          message: 'Customer berhasil ditambahkan',
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

  updateCustomer(int index, BuildContext context) async {
    if (validateField()) {
      try {
        final customer = CustomerEntity(
          name: nameController.text,
          phone: phoneController.text,
          address: addressController.text,
        );
        locator<CustomerDao>().update(index, customer);
        AppDialog.show(
          context: context,
          typeDialog: TypeDialog.SUCCESS,
          message: 'Data customer berhasil diubah',
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

  void onClose() {
    nameController.clear();
    phoneController.clear();
    addressController.clear();
  }
}
