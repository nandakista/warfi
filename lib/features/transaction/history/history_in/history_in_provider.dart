import 'package:desktop_base/app/app_service.dart';
import 'package:desktop_base/database/hive/dao/transaction_dao.dart';
import 'package:desktop_base/database/hive/entity/transaction/transaction_entity.dart';
import 'package:desktop_base/features/product/list_product/list_product_provider.dart';
import 'package:flutter/material.dart';

class HistoryInProvider with ChangeNotifier {

  List<TransactionEntity> _listRecap = [];
  List<TransactionEntity> get listRecap => _listRecap;

  late ResultState _state;
  ResultState get state => _state;

  String _message = '';
  String get message => _message;

  HistoryInProvider init() {
    _getRecap();
    return this;
  }

  Future<dynamic> _getRecap() async {
    _state = ResultState.LOADING;
    notifyListeners();
    try {
      final data = locator<TransactionDao>().getAll();
      if(data.isNotEmpty) {
        _state = ResultState.SUCCESS;
        notifyListeners();
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