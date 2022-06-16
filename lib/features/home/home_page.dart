import 'package:desktop_base/features/home/component/header_card_component.dart';
import 'package:desktop_base/helper/converter_helper.dart';
import 'package:desktop_base/models/product.dart';
import 'package:desktop_base/models/quantity.dart';
import 'package:desktop_base/themes/app_colors.dart';
import 'package:desktop_base/themes/app_style.dart';
import 'package:desktop_base/widgets/basic_widget.dart';
import 'package:desktop_base/widgets/content_wrapper.dart';
import 'package:fluent_ui/fluent_ui.dart' as fl;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  static const String route = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> data = dummyProduct;
    return ContentWrapper(
      title: 'Home',
      canBack: false,
      action: [
        ActionIcon(
          icon: Icons.notifications_none_outlined,
          onPressed: () {},
          countUpdate: 1,
        ),
        const SizedBox(width: 32),
      ],
      child: SingleChildScrollView(
        child: Column(
          children: [
            ..._buildHeader(),
            const SizedBox(height: 30),
            _buildBody(context, data),
          ],
        ),
      ),
    );
  }

  _buildHeader() {
    var dateNow = DateTime.now();
    return [
      Row(
        children: [
          HeaderCardComponent(
            title: '2661',
            subtitle: 'Total Produk',
            updateTitle: 1,
            icon: fl.FluentIcons.shop,
            dateUpdate: dateNow,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            backgroundColor: Colors.green,
          ),
          const HeaderCardComponent(
            title: '266',
            subtitle: 'Nota',
            icon: fl.FluentIcons.account_activity,
            margin: EdgeInsets.symmetric(horizontal: 16),
          ),
        ],
      )
    ];
  }

  _buildBody(BuildContext context, List<Product> data) {
    if(data.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 60),
          SvgPicture.asset('assets/images/img_empty_product.svg', width: 250),
          const SizedBox(height: 30),
          Center(child: Text('Anda belum \nmenambahkan Produk', textAlign: TextAlign.center,  style: AppStyle.subtitle1,)),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Row(
              children: [
                Flexible(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Text('Product',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Text('Harga',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Text('Kuantitas',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (_, index) => const Divider(),
            itemCount: data.length,
            itemBuilder: (_, index) {
              Product item = data[index];
              Quantity? quantity = item.quantity;
              return ListTile(
                trailing: IconButton(
                  icon: const Icon(fl.FluentIcons.edit_solid12),
                  color: AppColors.accent,
                  onPressed: () {},
                ),
                title: Row(
                  children: [
                    Flexible(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(item.name.toString()),
                      ),
                    ),
                    Flexible(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(AppConverter.toIDR(amount: item.price ?? 0)),
                      ),
                    ),
                    Flexible(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('${quantity?.box} Dus'),
                            const SizedBox(width: 16),
                            Text('${quantity?.bal} Bal'),
                            const SizedBox(width: 16),
                            Text('${quantity?.pack} Pack'),
                            const SizedBox(width: 16),
                            Text('${quantity?.pcs} Pcs'),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      );
    }
  }
}
