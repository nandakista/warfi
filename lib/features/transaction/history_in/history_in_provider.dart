import 'package:desktop_base/app/app_service.dart';
import 'package:desktop_base/database/drift/app_database.dart';
import 'package:desktop_base/database/drift/dao/transaction/transaction_dao.dart';
import 'package:desktop_base/features/product/list_product/list_product_provider.dart';
import 'package:flutter/material.dart';

class HistoryInProvider with ChangeNotifier {

  List<TransactionEntityData> _listRecap = [];
  List<TransactionEntityData> get listRecap => _listRecap;

  late ResultState _state;
  ResultState get state => _state;

  String _message = '';
  String get message => _message;

  HistoryInProvider init() {
    _getTransaction();
    _getRecap();
    return this;
  }

  _getTransaction() async {
    try {
      final dataTrans = await locator<TransactionDao>().getAllTransaction();
      debugPrint('Transaksi : $dataTrans');
    } catch (e) {
      debugPrint('Error : $e');
    }
  }

  Future<dynamic> _getRecap() async {
    _state = ResultState.LOADING;
    notifyListeners();
    try {
      final data = await locator<TransactionDao>().getAllTransaction();
      if(data.isNotEmpty) {
        _state = ResultState.SUCCESS;
        notifyListeners();
        debugPrint('Result : $data');
        return _listRecap = data;
      } else {
        _state = ResultState.EMPTY;
        notifyListeners();
        return _message = 'Anda belum \nmenambahkan Produk';
      }
    } catch (e) {
      _state = ResultState.ERROR;
      debugPrint("Error : $e");
      return _message = 'Error --> $e';
    }
  }
}