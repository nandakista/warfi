import 'package:desktop_base/app/app_constant.dart';
import 'package:desktop_base/database/hive/entity/transaction/transaction_entity.dart';
import 'package:desktop_base/features/product/list_product/list_product_provider.dart';
import 'package:desktop_base/features/transaction/history_in/history_in_provider.dart';
import 'package:desktop_base/helper/converter_helper.dart';
import 'package:desktop_base/themes/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HistoryInTab extends StatelessWidget {
  const HistoryInTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HistoryInProvider().init(),
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(AppConst.defaultMargin),
          child: Consumer<HistoryInProvider>(
            builder: (ctx, provider, _) {
              final data = provider.listRecap;
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
                  return _buildListProduct(context: context, data: data);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyData({required String message, required String imageUri}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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

  Widget _buildListProduct({
    required BuildContext context,
    required List<TransactionEntity> data,
  }) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemCount: data.length,
      itemBuilder: (_, index) {
        TransactionEntity item = data[index];
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
              const Spacer(),
              Flexible(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                        child: Text('${item.dus} Dus',
                            style: AppStyle.small)),
                    const SizedBox(width: 16),
                    Expanded(
                        child: Text('${item.bal} Bal',
                            style: AppStyle.small)),
                    const SizedBox(width: 16),
                    Expanded(
                        child: Text('${item.pack} Pack',
                            style: AppStyle.small)),
                    const SizedBox(width: 16),
                    Expanded(
                        child: Text('${item.pcs} Pcs',
                            style: AppStyle.small)),
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
