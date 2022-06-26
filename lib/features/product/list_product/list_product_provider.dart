import 'package:desktop_base/app/app_service.dart';
import 'package:desktop_base/database/drift/dao/product/product_dao.dart';
import 'package:desktop_base/database/drift/dao/transaction/transaction_dao.dart';
import 'package:desktop_base/database/drift/app_database.dart';
import 'package:desktop_base/helper/converter_helper.dart';
import 'package:desktop_base/helper/date_time_helper.dart';
import 'package:flutter/material.dart';

enum ResultState { LOADING, EMPTY, ERROR, SUCCESS}

class ListProductProvider with ChangeNotifier {

  List<ProductEntityData> _listProduct = [];
  List<ProductEntityData> get listProduct => _listProduct;

  late ResultState _state;
  ResultState get state => _state;

  String _message = '';
  String get message => _message;

  ListProductProvider init() {
    _getListProduct();
    return this;
  }

  Future<dynamic> _getListProduct() async {
    _state = ResultState.LOADING;
    notifyListeners();
    try {
      final data = await locator<ProductDao>().getAllProduct();
      if(data.isNotEmpty) {
        _state = ResultState.SUCCESS;
        notifyListeners();
        return _listProduct = data;
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

  deleteProduct(String id) async {
    _state = ResultState.LOADING;
    notifyListeners();
    try {
      _state = ResultState.SUCCESS;
      await locator<ProductDao>().deleteProduct(id);
      _getListProduct();
      notifyListeners();
    } catch (e) {
      _state = ResultState.ERROR;
      debugPrint('Error : $e');
    }
  }
}
