import 'package:desktop_base/features/product/add_product/add_product_provider.dart';
import 'package:desktop_base/helper/input_formater.dart';
import 'package:desktop_base/helper/validator_helper.dart';
import 'package:desktop_base/themes/app_style.dart';
import 'package:desktop_base/widgets/content_wrapper.dart';
import 'package:desktop_base/widgets/custom_button.dart';
import 'package:desktop_base/widgets/custom_form_field.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AddProductPage extends StatelessWidget {
  static const String route = '/add-product';
  const AddProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddProductProvider>(context, listen: false);
    return ContentWrapper(
      title: 'Tambah Produk',
      child: Form(
        key: provider.formKey,
        child: ListView(
          children: [
            Text(
              'Silahkan isi data dibawah untuk menambahkan barang',
              style: AppStyle.subtitle3,
            ),
            const SizedBox(height: 24),
            _buildField('Nama Barang', 'Nama', provider.nameController,
                icon: FluentIcons.product_catalog),
            const SizedBox(height: 24),
            _buildField(
              'Harga',
              'Harga',
              provider.priceController,
              icon: FluentIcons.money,
              inputFormatter: <TextInputFormatter> [
                FilteringTextInputFormatter.digitsOnly,
                CurrencyInputFormatter()
              ],
              // startText: 'Rp',
              endText: 'Rupiah'
            ),
            const SizedBox(height: 24),
            Text('Jumlah', style: AppStyle.subtitle3),
            const SizedBox(height: 8),
            CustomFieldForm(
              label: 'Dus',
              hint: 'Dus',
              endText: 'Dus',
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) => FieldValidator.validate(value!),
              icon: FluentIcons.product,
              controller: provider.boxController,
            ),
            const SizedBox(height: 16),
            CustomFieldForm(
              label: 'Bal',
              hint: 'Bal',
              endText: 'Bal',
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) => FieldValidator.validate(value!),
              icon: FluentIcons.quantity,
              controller: provider.balController,
            ),
            const SizedBox(height: 16),
            CustomFieldForm(
              label: 'Pack',
              hint: 'Pack',
              endText: 'Pack',
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) => FieldValidator.validate(value!),
              icon: FluentIcons.packages,
              controller: provider.packController,
            ),
            const SizedBox(height: 16),
            CustomFieldForm(
              label: 'Pcs',
              hint: 'Pcs',
              endText: 'Pcs',
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) => FieldValidator.validate(value!),
              icon: FluentIcons.pie_single,
              controller: provider.pcsController,
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: 'Tambah Barang',
              icon: FluentIcons.add,
              fontWeight: FontWeight.bold,
              onPress: () {
                provider.addProduct(context);
              },
            ),
          ],
        ),
      ),
      // ),
    );
  }

  _buildField(String title, String hint, TextEditingController controller,

      {IconData? icon, String? startText, String? endText, List<TextInputFormatter>? inputFormatter}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppStyle.subtitle3),
        const SizedBox(height: 8),
        CustomFieldForm(
          label: hint,
          hint: hint,
          validator: (value) => FieldValidator.validate(value!),
          icon: icon!,
          startText: startText,
          controller: controller,
          endText: endText,
          inputFormatters: inputFormatter,
        ),
      ],
    );
  }
}
