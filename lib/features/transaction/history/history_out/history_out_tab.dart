import 'dart:developer';

import 'package:desktop_base/app/app_constant.dart';
import 'package:desktop_base/database/hive/entity/recap/recap_entity.dart';
import 'package:desktop_base/features/transaction/history/history_out/history_out_provider.dart';
import 'package:desktop_base/helper/converter_helper.dart';
import 'package:desktop_base/helper/date_time_helper.dart';
import 'package:desktop_base/helper/provider_state.dart';
import 'package:desktop_base/themes/app_colors.dart';
import 'package:desktop_base/themes/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HistoryOutTab extends StatelessWidget {
  const HistoryOutTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HistoryOutProvider>(context, listen: false);
    return ChangeNotifierProvider(
      create: (_) => HistoryOutProvider().init(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => provider.toCreateTransaction(context),
          backgroundColor: AppColors.primary,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(AppConst.defaultMargin),
            child: Consumer<HistoryOutProvider>(
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
                    return _buildListProduct(data: data);
                }
              },
            ),
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
    required List<RecapEntity> data,
  }) {
    return Column(
      children: [
        _buildHeaderList(),
        const Divider(),
        _buildBodyList(data: data),
      ],
    );
  }

  _buildHeaderList() {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 4,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Nama Customer',
                    style: AppStyle.small.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Total Harga',
                    textAlign: TextAlign.center,
                    style: AppStyle.small.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Kurang',
                    textAlign: TextAlign.center,
                    style: AppStyle.small.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Karyawan',
                    textAlign: TextAlign.center,
                    style: AppStyle.small.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Flexible(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Tanggal',
                    textAlign: TextAlign.center,
                    style: AppStyle.small.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Catatan',
                    textAlign: TextAlign.right,
                    style: AppStyle.small.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildBodyList({required List<RecapEntity> data}) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (_, index) => const Divider(),
      itemCount: data.length,
      itemBuilder: (_, index) {
        RecapEntity item = data[index];
        log('item = ${item.listProduct}');
        int totalHarga = 0;
        for(var e in item.listProduct) {
          log('element = ${e.price}');
          log('element dus = ${e.dus}');
          log('element bal = ${e.bal}');
          log('element pack = ${e.pack}');
          log('element pcs = ${e.pcs}');
          int totalQuantity;
          int qDus = e.dus! * 20;
          int qBal = e.bal! * 10;
          int qPack = e.pack! * 6;
          int qPcs = e.pcs!;
          totalQuantity = qBal + qDus + qPack + qPcs;
          log('totalQ = $totalQuantity');
          totalHarga = totalHarga + (e.price! * totalQuantity);
        }
        return ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 4,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${item.customer.name}',
                        style: AppStyle.small,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        (totalHarga).toIDR(),
                        textAlign: TextAlign.center,
                        style: AppStyle.small,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        (item.debt).toIDR(),
                        textAlign: TextAlign.center,
                        style: AppStyle.small,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        item.account.name ?? 'Error',
                        textAlign: TextAlign.center,
                        style: AppStyle.small,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Flexible(
                flex: 3,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${DateHelper(date: item.createdAt).format5()} WIB',
                        textAlign: TextAlign.center,
                        style: AppStyle.small,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        item.note ?? 'Error',
                        textAlign: TextAlign.right,
                        style: AppStyle.small,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
