import 'package:desktop_base/database/hive/entity/product/product_entity.dart';
import 'package:desktop_base/features/home/component/header_card_component.dart';
import 'package:desktop_base/features/product/list_product/list_product_provider.dart';
import 'package:desktop_base/helper/converter_helper.dart';
import 'package:desktop_base/helper/provider_state.dart';
import 'package:desktop_base/themes/app_style.dart';
import 'package:desktop_base/widgets/basic_widget.dart';
import 'package:desktop_base/widgets/content_wrapper.dart';
import 'package:fluent_ui/fluent_ui.dart' as fl;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const String route = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentWrapper(
      title: 'Home',
      action: [
        ActionIcon(
          icon: fl.FluentIcons.ringer,
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
            Consumer<ListProductProvider>(
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
                      message: provider.message,
                      imageUri: 'assets/images/img_empty_product.svg',
                    );
                  case ResultState.SUCCESS:
                    return _buildListProduct(context: context, data: data);
                }
              },
            ),
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
            backgroundColor: Colors.blue,
          ),
        ],
      )
    ];
  }

  _buildEmptyData({required String message, required String imageUri}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 60),
        SvgPicture.asset('assets/images/img_empty_product.svg', width: 250),
        const SizedBox(height: 30),
        Center(
            child: Text(
          'Anda belum \nmenambahkan Produk',
          textAlign: TextAlign.center,
          style: AppStyle.subtitle1,
        )),
      ],
    );
  }

  _buildListProduct({
    required BuildContext context,
    required List<ProductEntity> data,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '5 Produk terbaru',
                style: AppStyle.subtitle1.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'yang baru ditambahkan',
                style: AppStyle.subtitle3,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
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
                flex: 2,
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
          itemCount: data.length < 8 ? data.length : 8,
          itemBuilder: (_, index) {
            ProductEntity item = data[index];
            return ListTile(
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
                      child: Text((item.price?.toInt() ?? 0).toIDR(),),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(child: Text('${item.dus} Dus')),
                          const SizedBox(width: 16),
                          Expanded(child: Text('${item.bal} Bal')),
                          const SizedBox(width: 16),
                          Expanded(child: Text('${item.pack} Pack')),
                          const SizedBox(width: 16),
                          Expanded(child: Text('${item.pcs} Pcs')),
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
