import 'package:desktop_base/database/hive/entity/product/product_entity.dart';
import 'package:desktop_base/features/product/add_product/add_product_page.dart';
import 'package:desktop_base/features/product/list_product/list_product_provider.dart';
import 'package:desktop_base/helper/converter_helper.dart';
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
    final provider = Provider.of<ListProductProvider>(context, listen: false);
    return RefreshIndicator(
      onRefresh: () async => provider.init(),
      child: ContentWrapper(
        title: 'Product List',
        canBack: false,
        action: [
          IconButton(
              onPressed: () => provider.init(),
              icon: const Icon(
                fl.FluentIcons.refresh,
                size: 24,
                color: AppColors.systemDarkGrey,
              )),
          const SizedBox(
            width: 30,
          ),
        ],
        floatingActionButton: FloatingActionButton(
          onPressed: () => provider.toAddProduct(context),
          backgroundColor: AppColors.primary,
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
              case ResultState.ERROR:
                return _buildEmptyData(
                  message: 'Terjadi kesalahan ${provider.message}',
                  imageUri: 'assets/images/img_empty_product.svg',
                );
              case ResultState.SUCCESS:
                return _buildListProduct(
                    context: context, data: data, provider: provider);
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
    required ListProductProvider provider,
    required List<ProductEntity> data,
  }) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemCount: data.length,
      itemBuilder: (_, index) {
        ProductEntity item = data[index];
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
                              style: AppStyle.subtitle4,
                            ),
                            Text(
                              AppConverter.toIDR(amount: item.price ?? 0),
                              style: AppStyle.normal,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Flexible(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                        child: Text('${item.dus} Dus', style: AppStyle.small)),
                    const SizedBox(width: 16),
                    Expanded(
                        child: Text('${item.bal} Bal', style: AppStyle.small)),
                    const SizedBox(width: 16),
                    Expanded(
                        child:
                            Text('${item.pack} Pack', style: AppStyle.small)),
                    const SizedBox(width: 16),
                    Expanded(
                        child: Text('${item.pcs} Pcs', style: AppStyle.small)),
                    InkWell(
                      onTap: () {
                        provider.toEditProduct(context, item);
                      },
                      child: const Icon(
                        fl.FluentIcons.edit,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(width: 16),
                    InkWell(
                      onTap: () {
                        provider.deleteProduct(item);
                      },
                      child: const Icon(
                        fl.FluentIcons.delete,
                        color: AppColors.primary,
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
}
