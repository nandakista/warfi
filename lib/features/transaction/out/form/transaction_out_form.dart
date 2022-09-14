import 'package:desktop_base/database/hive/entity/product/product_entity.dart';
import 'package:desktop_base/features/transaction/out/form/transaction_out_provider.dart';
import 'package:desktop_base/helper/converter_helper.dart';
import 'package:desktop_base/helper/input_formater.dart';
import 'package:desktop_base/widgets/basic_widget.dart';
import 'package:fluent_ui/fluent_ui.dart' as fl;
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
    final provider =
        Provider.of<TransactionOutProvider>(context, listen: false);
    provider.debtController.value = CurrencyInputFormatter.defaultFormat('0');
    return ContentWrapper(
      title: 'Tambah Penjualan/Pengeluaran',
      child: Form(
        key: provider.formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                icon: CupertinoIcons.person_crop_rectangle,
                readOnly: true,
                validator: (value) => null,
                endIcon: Icons.arrow_forward_ios,
                onPress: () {
                  provider.toPickCustomer(context);
                },
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
              const SizedBox(height: 8),
              Consumer<TransactionOutProvider>(builder: (ctx, provider, _) {
                return _buildListProduct(
                  context: context,
                  data: provider.listProduct,
                  provider: provider,
                );
              }),
              const SizedBox(height: 16),
              CustomButton(
                text: 'Tambah Produk',
                onPress: () => provider.toAddProduct(context),
                icon: CupertinoIcons.plus,
                borderRadius: 32,
                width: 200,
                color: (context.isDarkMode())
                    ? AppColors.baseDark
                    : AppColors.baseLight,
                iconColor: AppColors.primary,
                textColor: AppColors.primary,
              ),
              const SizedBox(height: 26),
              CustomButton(
                text: 'Buat Transaksi',
                onPress: () {
                  provider.createTransaction(context);
                },
                icon: CupertinoIcons.check_mark,
                borderRadius: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListProduct({
    required BuildContext context,
    required TransactionOutProvider provider,
    required List<ProductEntity> data,
  }) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: data.length,
      itemBuilder: (_, index) {
        ProductEntity item = data[index];
        final dusC = provider.listDusController[index];
        final balC = provider.listBalController[index];
        final packC = provider.listPackController[index];
        final pcsC = provider.listPcsController[index];
        return ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 40,
                      height: 40,
                      child: Image(
                          image: AssetImage(
                            'assets/images/img_register.png',
                          ),
                          fit: BoxFit.cover),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name.toString(),
                              style: AppStyle.subtitle4,
                            ),
                            Text(
                              (item.price?.toInt() ?? 0).toIDR(),
                              style: AppStyle.normal,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 50),
              Flexible(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ..._buildField(
                      index: index,
                      provider: provider,
                      controller: dusC,
                      satuan: 'Dus',
                      onPlus: () {
                        int quantity = provider.plusQuantity(dusC);
                        provider.listProduct[index].dus = quantity;
                      },
                      onMinus: () => provider.minusQuantity(dusC),
                    ),
                    const SizedBox(width: 16),
                    const SizedBox(width: 16),
                    ..._buildField(
                      index: index,
                      provider: provider,
                      controller: balC,
                      satuan: 'Bal',
                      onPlus: () => provider.plusQuantity(balC),
                      onMinus: () => provider.minusQuantity(balC),
                    ),
                    const SizedBox(width: 16),
                    ..._buildField(
                      index: index,
                      provider: provider,
                      controller: packC,
                      satuan: 'Pack',
                      onPlus: () => provider.plusQuantity(packC),
                      onMinus: () => provider.minusQuantity(packC),
                    ),
                    const SizedBox(width: 16),
                    ..._buildField(
                      index: index,
                      provider: provider,
                      controller: pcsC,
                      satuan: 'Pcs',
                      onPlus: () => provider.plusQuantity(pcsC),
                      onMinus: () => provider.minusQuantity(pcsC),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: InkWell(
                        onTap: () => provider.toRemoveProduct(item),
                        child: const Icon(
                          fl.FluentIcons.delete,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  _buildField({
    required TransactionOutProvider provider,
    required int index,
    required TextEditingController? controller,
    required String satuan,
    required void Function()? onMinus,
    required void Function()? onPlus,
  }) {
    return [
      Expanded(
        child: Column(
          children: [
            InkWell(
              onTap: onPlus,
              child: const Icon(Icons.keyboard_arrow_up_outlined),
            ),
            InkWell(
              onTap: onMinus,
              child: const Icon(Icons.keyboard_arrow_down_outlined),
            ),
          ],
        ),
      ),
      Container(
        // margin: const EdgeInsets.all(10),
        width: 40,
        child: TextFormField(
          controller: controller,
          textAlign: TextAlign.center,
          maxLength: 3,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: const InputDecoration(
            counterText: "",
            hintText: "0",
          ),
        ),
      ),
      Text(satuan, style: AppStyle.small)
    ];
  }
}
