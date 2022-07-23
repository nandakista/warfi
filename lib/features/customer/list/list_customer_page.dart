import 'package:desktop_base/app/app_constant.dart';
import 'package:desktop_base/database/hive/entity/customer/customer_entity.dart';
import 'package:desktop_base/features/customer/list/list_customer_provider.dart';
import 'package:desktop_base/helper/converter_helper.dart';
import 'package:desktop_base/helper/provider_state.dart';
import 'package:desktop_base/themes/app_colors.dart';
import 'package:desktop_base/themes/app_style.dart';
import 'package:desktop_base/widgets/content_wrapper.dart';
import 'package:fluent_ui/fluent_ui.dart' as fl;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ListCustomerPage extends StatelessWidget {
  // static const String route = '/products/out/form/pick-customer';
  static const String route = '/customer/list';
  const ListCustomerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ListCustomerProvider>(context, listen: false);
    return ContentWrapper(
      title: 'Daftar Customer',
      action: [
        IconButton(
            onPressed: () => provider.init(),
            icon: const Icon(
              CupertinoIcons.refresh_thick,
              size: 24,
              color: AppColors.systemDarkGrey,
            )),
        const SizedBox(width: 30),
      ],
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () => provider.toAddCustomer(context),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      child: Consumer<ListCustomerProvider>(
        builder: (ctx, provider, _) {
          final data = provider.listCustomer;
          switch (provider.state) {
            case ResultState.LOADING:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ResultState.EMPTY:
              return _buildEmptyData(
                message: provider.message,
                imageUri: 'assets/images/img_empty_product.svg',
              );
            case ResultState.ERROR:
              return _buildEmptyData(
                message: 'Terjadi kesalahan : ${provider.message}',
                imageUri: 'assets/images/img_empty_product.svg',
              );
            case ResultState.SUCCESS:
              return _buildListCustomer(
                context: context,
                data: data,
                provider: provider,
              );
          }
        },
      ),
    );
  }

  Widget _buildEmptyData({required String message, required String imageUri}) {
    return Column(
      children: [
        const SizedBox(height: 30),
        SvgPicture.asset(imageUri, width: 250),
        const SizedBox(height: 30),
        Center(
            child: Text(
          message,
          textAlign: TextAlign.center,
          style: AppStyle.subtitle1,
        )),
      ],
    );
  }

  _buildListCustomer({
    required BuildContext context,
    required List<CustomerEntity> data,
    required ListCustomerProvider provider,
  }) {
    return ListView.separated(
      separatorBuilder: (_, index) => const Divider(),
      itemCount: data.length,
      itemBuilder: (_, index) {
        final item = data[index];
        return ListTile(
          leading: const CircleAvatar(
            child: Image(image: AssetImage('assets/images/img_person.png')),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(item.name.toString().capitalize())),
              Expanded(
                child: Text(item.phone.toString(), textAlign: TextAlign.start),
              ),
              Expanded(
                child:
                    Text(item.address.toString(), textAlign: TextAlign.start),
              ),
              const SizedBox(width: 16),
              Row(
                children: [
                  InkWell(
                    onTap: () => provider.toEditCustomer(context, index, item),
                    child: const Icon(
                      fl.FluentIcons.edit,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 16),
                  InkWell(
                    onTap: () => provider.deleteCustomer(index),
                    child: const Icon(
                      fl.FluentIcons.delete,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
