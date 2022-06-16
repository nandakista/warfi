import 'package:desktop_base/features/product/add_product/add_product_page.dart';
import 'package:desktop_base/helper/converter_helper.dart';
import 'package:desktop_base/models/product.dart';
import 'package:desktop_base/models/quantity.dart';
import 'package:desktop_base/themes/app_colors.dart';
import 'package:desktop_base/themes/app_style.dart';
import 'package:desktop_base/widgets/content_wrapper.dart';
import 'package:fluent_ui/fluent_ui.dart' as fl;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ListProductPage extends StatelessWidget {
  static const String route = '/list-product';
  const ListProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> data = dummyProduct;
    return ContentWrapper(
      title: 'Product List',
      canBack: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, AddProductPage.route),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      child: (data.isEmpty)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                SvgPicture.asset('assets/images/img_empty_product.svg', width: 300),
                const SizedBox(height: 30),
                Center(
                    child: Text(
                  'Anda belum \nmenambahkan Produk',
                  textAlign: TextAlign.center,
                  style: AppStyle.subtitle1,
                )),
              ],
            )
          : ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: data.length,
              itemBuilder: (_, index) {
                Product item = data[index];
                Quantity? quantity = item.quantity;
                return ListTile(
                  trailing: IconButton(
                    icon: const Icon(fl.FluentIcons.edit_solid12),
                    color: AppColors.secondary,
                    onPressed: () {},
                  ),
                  title: Row(
                    children: [
                      const SizedBox(
                        width: 60,
                        height: 60,
                        child: Image(
                            image: AssetImage(
                              'assets/images/img_register.png',
                            ),
                            fit: BoxFit.cover),
                      ),
                      const SizedBox(width: 24),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name.toString(),
                            style: AppStyle.subtitle2,
                          ),
                          Text(AppConverter.toIDR(amount: item.price ?? 0)),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text('${quantity?.box} Dus'),
                          const SizedBox(width: 16),
                          Text('${quantity?.bal} Bal'),
                          const SizedBox(width: 16),
                          Text('${quantity?.pack} Pack'),
                          const SizedBox(width: 16),
                          Text('${quantity?.pcs} Pcs'),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}
