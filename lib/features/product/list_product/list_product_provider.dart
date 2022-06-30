import 'package:desktop_base/app/app_service.dart';
import 'package:desktop_base/database/hive/dao/product_dao.dart';
import 'package:desktop_base/database/hive/entity/product/product_entity.dart';
import 'package:desktop_base/features/product/add_product/add_product_page.dart';
import 'package:desktop_base/models/product.dart';
import 'package:flutter/material.dart';

enum ResultState { LOADING, EMPTY, ERROR, SUCCESS }

class ListProductProvider with ChangeNotifier {
  List<ProductEntity> _listProduct = [];
  List<ProductEntity> get listProduct => _listProduct;

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
      final data = locator<ProductDao>().getAll();
      if (data.isNotEmpty) {
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

  deleteProduct(ProductEntity entity) async {
    _state = ResultState.LOADING;
    notifyListeners();
    try {
      _state = ResultState.SUCCESS;
      await locator<ProductDao>().delete(entity);
      _getListProduct();
      notifyListeners();
    } catch (e) {
      _state = ResultState.ERROR;
      debugPrint('Error : $e');
    }
  }

  toAddProduct(BuildContext context) {
    return Navigator.pushNamed(context, AddProductPage.route,
            arguments: ProductStatus.ADD)
        .then((value) => init());
  }

  toEditProduct(BuildContext context, ProductEntity product) {
    return Navigator.pushNamed(context, AddProductPage.route, arguments: {
      'product_status': ProductStatus.UPDATE,
      'product': product,
    });
  }
}
