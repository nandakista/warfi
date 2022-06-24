import 'package:desktop_base/database/drift/drift_db.dart';
import 'package:desktop_base/features/product/add_product/add_product_page.dart';
import 'package:desktop_base/features/product/list_product/list_product_provider.dart';
import 'package:desktop_base/helper/converter_helper.dart';
import 'package:desktop_base/models/product.dart';
import 'package:desktop_base/models/quantity.dart';
import 'package:desktop_base/themes/app_colors.dart';
import 'package:desktop_base/themes/app_style.dart';
import 'package:desktop_base/widgets/content_wrapper.dart';
import 'package:fluent_ui/fluent_ui.dart' as fl;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ListProductPage extends StatelessWidget {
  static const String route = '/list-product';
  const ListProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ListProductProvider>(context);
    return RefreshIndicator(
      onRefresh: () async => provider.getListProduct(),
      child: ContentWrapper(
        title: 'Product List',
        canBack: false,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, AddProductPage.route),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        child: Consumer<ListProductProvider>(
          builder: (ctx, provider, _) {
            final data = provider.listProduct;
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
              case ResultState.SUCCESS:
                return _buildListProduct(context: context, data: data);
              case ResultState.ERROR:
                return _buildEmptyData(
                  message: 'Terjadi kesalahan ${provider.message}',
                  imageUri: 'assets/images/img_empty_product.svg',
                );
            }
          },
        ),
      ),
    );
  }

  Widget _buildEmptyData({required String message, required String imageUri}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 30),
        SvgPicture.asset(imageUri, width: 300),
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

  Widget _buildListProduct({
    required BuildContext context,
    required List<ProductEntityData> data,
  }) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemCount: data.length,
      itemBuilder: (_, index) {
        ProductEntityData item = data[index];
        // Quantity? quantity = item.quantity;
        return ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2,
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
                              style: AppStyle.subtitle3,
                            ),
                            Text(AppConverter.toIDR(amount: item.price)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Flexible(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(child: Text('${item.box} Dus')),
                    const SizedBox(width: 16),
                    Expanded(child: Text('${item.bal} Bal')),
                    const SizedBox(width: 16),
                    Expanded(child: Text('${item.pack} Pack')),
                    const SizedBox(width: 16),
                    Expanded(child: Text('${item.pcs} Pcs')),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        fl.FluentIcons.edit_solid12,
                        color: AppColors.primary,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
