import 'package:desktop_base/features/transaction/out/form/transaction_out_provider.dart';
import 'package:desktop_base/helper/input_formater.dart';
import 'package:desktop_base/helper/validator_helper.dart';
import 'package:desktop_base/themes/app_colors.dart';
import 'package:desktop_base/themes/app_style.dart';
import 'package:desktop_base/themes/app_theme.dart';
import 'package:desktop_base/widgets/content_wrapper.dart';
import 'package:desktop_base/widgets/custom_button.dart';
import 'package:desktop_base/widgets/custom_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class TransactionOutForm extends StatelessWidget {
  static const String route = '/products/out/form';
  const TransactionOutForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TransactionOutProvider>(context, listen: false);
    provider.debtController.value = CurrencyInputFormatter.defaultFormat('0');
    return ContentWrapper(
      title: 'Tambah Penjualan/Pengeluaran',
      child: Form(
        key: provider.formKey,
        child: ListView(
          children: [
            Text(
              'Silahkan isi data dibawah untuk membuat transaksi pengeluaran',
              style: AppStyle.subtitle3,
            ),
            const SizedBox(height: 24),
            CustomFieldForm(
              label: 'Pilih Customer',
              hint: 'Customer',
              controller: provider.customerController,
              icon: CupertinoIcons.person_add,
              readOnly: true,
              validator: (value) => null,
              endIcon: Icons.arrow_forward_ios,
              onPress: (){ provider.toPickCustomer(context); },
            ),
            const SizedBox(height: 16),
            CustomFieldForm(
              label: 'Kurang',
              hint: 'Kurang',
              validator: (value) => null,
              controller: provider.debtController,
              icon: CupertinoIcons.minus_slash_plus,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
                CurrencyInputFormatter()
              ],
            ),
            const SizedBox(height: 24),
            Text('Catatan', style: AppStyle.subtitle3),
            const SizedBox(height: 8),
            CustomFieldForm(
              label: 'Catatan',
              hint: 'Catatan',
              validator: (value) => null,
              controller: provider.noteController,
              maxLines: 5,
            ),
            const SizedBox(height: 16),
            Text('Produk', style: AppStyle.subtitle3),
            const SizedBox(height: 16),
            CustomButton(
              text: 'Tambah Produk',
              onPress: () {
                provider.createTransaction(context);
              },
              icon: CupertinoIcons.plus,
              borderRadius: 32,
              color: (context.isDarkMode())
                  ? AppColors.baseDark
                  : AppColors.baseLight,
              iconColor: AppColors.primary,
              textColor: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
