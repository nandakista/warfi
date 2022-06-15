import 'package:desktop_base/features/product/add_product/add_product_page.dart';
import 'package:desktop_base/themes/app_style.dart';
import 'package:desktop_base/widgets/content_wrapper.dart';
import 'package:flutter/material.dart';

class ListProductPage extends StatelessWidget {
  static const String route = '/list-product';
  const ListProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentWrapper(
      title: 'Product List',
      canBack: false,
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, AddProductPage.route),
          child: const Icon(Icons.add)),
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: 5,
        itemBuilder: (_, index) {
          return _buildItem();
        },
      ),
    );
  }

  _buildItem() {
    return ListTile(
      trailing: InkWell(
        child: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {},
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
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
            children: [
              Text(
                'Name',
                style: AppStyle.subtitle2,
              ),
              const Text('Rp. 0,00'),
            ],
          ),
          Spacer(),
          Row(
            children: [
              Text('0 Dus'),
              SizedBox(width: 16),
              Text('0 Bal'),
              SizedBox(width: 16),
              Text('0 Pack'),
              SizedBox(width: 16),
              Text('0 Pcs'),
            ],
          )
        ],
      ),
    );
  }
}
