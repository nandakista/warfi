import 'package:desktop_base/features/customer/form/add_customer_provider.dart';
import 'package:desktop_base/features/customer/list/list_customer_provider.dart';
import 'package:desktop_base/helper/validator_helper.dart';
import 'package:desktop_base/themes/app_style.dart';
import 'package:desktop_base/widgets/content_wrapper.dart';
import 'package:desktop_base/widgets/custom_button.dart';
import 'package:desktop_base/widgets/custom_form_field.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCustomerPage extends StatelessWidget {
  static const String route = '/customer/add';
  const AddCustomerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    final status = arg['customer_status'];
    final index = arg['index'];
    final customer = arg['customer'];

    final provider = Provider.of<AddCustomerProvider>(context, listen: false);
    provider.initPage(status, index, customer);
    return ContentWrapper(
      title: (status == CustomerAction.ADD) ? 'Tambah Data Customer' : 'Edit Data Customer',
      child: Form(
        key: provider.formKey,
        child: ListView(
          children: [
            Text(
              'Silahkan isi data dibawah untuk data customer',
              style: AppStyle.subtitle3,
            ),
            const SizedBox(height: 24),
            Text('Nama Customer', style: AppStyle.subtitle3),
            const SizedBox(height: 8),
            CustomFieldForm(
              label: 'Nama',
              hint: 'Nama Customer',
              validator: (value) => FieldValidator.validate(value!),
              controller: provider.nameController,
              icon: CupertinoIcons.person,
            ),
            const SizedBox(height: 24),
            Text('No. Telepon Customer', style: AppStyle.subtitle3),
            const SizedBox(height: 8),
            CustomFieldForm(
              label: 'No. Telepon',
              hint: 'No. Telepon Customer',
              validator: (value) => TelephoneFieldValidator.validate(value!),
              controller: provider.phoneController,
              icon: CupertinoIcons.person,
            ),
            const SizedBox(height: 24),
            Text('Alamat Customer', style: AppStyle.subtitle3),
            const SizedBox(height: 8),
            CustomFieldForm(
              label: 'Alamat',
              hint: 'Alamat Customer',
              validator: (value) => FieldValidator.validate(value!),
              controller: provider.addressController,
              maxLines: 5,
              icon: Icons.location_on_outlined,
            ),
            const SizedBox(height: 24),
            CustomButton(
              text:
              (status == CustomerAction.ADD) ? 'Tambah Barang' : 'Edit Barang',
              icon: (status == CustomerAction.ADD)
                  ? FluentIcons.add
                  : FluentIcons.edit,
              fontWeight: FontWeight.bold,
              onPress: () {
                if(status == CustomerAction.ADD) {
                  provider.addCustomer(context);
                } else {
                  provider.updateCustomer(index, context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
