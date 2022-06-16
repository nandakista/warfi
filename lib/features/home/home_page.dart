import 'package:desktop_base/features/home/component/header_card_component.dart';
import 'package:desktop_base/themes/app_colors.dart';
import 'package:desktop_base/widgets/basic_widget.dart';
import 'package:desktop_base/widgets/content_wrapper.dart';
import 'package:fluent_ui/fluent_ui.dart' as fl;
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String route = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(height: 50),
            _buildBody(context),
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

  _buildBody(BuildContext context) {
    return Column(
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
          itemCount: 5,
          itemBuilder: (_, index) {
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
                      child: const Text('Item Name'),
                    ),
                  ),
                  Flexible(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const Text('Rp. 0,00'),
                    ),
                  ),
                  Flexible(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text('0 Dus'),
                          SizedBox(width: 16),
                          Text('0 Bal'),
                          SizedBox(width: 16),
                          Text('0 Pack'),
                          SizedBox(width: 16),
                          Text('0 Pcs'),
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
