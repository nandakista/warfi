import 'package:desktop_base/app/app_service.dart';
import 'package:desktop_base/database/drift/drift_db.dart';
import 'package:flutter/material.dart';

enum ResultState { LOADING, EMPTY, SUCCESS, ERROR }

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
      final data = await locator<AppDatabase>().getAllProduct();
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

  deleteProduct(int id) async {
    _state = ResultState.LOADING;
    notifyListeners();
    try {
      _state = ResultState.SUCCESS;
      locator<AppDatabase>().deleteProduct(id);
      _getListProduct();
      notifyListeners();
    } catch (e) {
      _state = ResultState.ERROR;
      print('Error : $e');
    }
  }
}
