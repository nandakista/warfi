import 'package:desktop_base/app/app_service.dart';
import 'package:desktop_base/database/hive/dao/customer_dao.dart';
import 'package:desktop_base/database/hive/entity/customer/customer_entity.dart';
import 'package:desktop_base/features/customer/form/add_customer_page.dart';
import 'package:desktop_base/helper/provider_state.dart';
import 'package:flutter/material.dart';

class ListCustomerProvider with ChangeNotifier {
  List<CustomerEntity> _listCustomer = [];
  List<CustomerEntity> get listCustomer => _listCustomer;

  late ResultState _state;
  ResultState get state => _state;

  String _message = '';
  String get message => _message;

  ListCustomerProvider init() {
    _getCustomers();
    return this;
  }

  _getCustomers() async {
    _state = ResultState.LOADING;
    notifyListeners();
    try {
      final data = locator<CustomerDao>().getAll();
      if (data.isNotEmpty) {
        _state = ResultState.SUCCESS;
        notifyListeners();
        return _listCustomer = data;
      } else {
        _state = ResultState.EMPTY;
        notifyListeners();
        return _message = 'Anda belum \nmenambahkan Data Customer';
      }
    } catch (e) {
      _state = ResultState.ERROR;
      debugPrint("Error : $e");
      return _message = 'Error --> $e';
    }
  }

  toAddCustomer(BuildContext context) {
    return Navigator.pushNamed(
      context,
      AddCustomerPage.route,
      arguments: {'customer_status': CustomerAction.ADD},
    ).then((_) => init());
  }

  toEditCustomer(BuildContext context, int index, CustomerEntity entity) {
    return Navigator.pushNamed(
      context,
      AddCustomerPage.route,
      arguments: {
        'customer_status': CustomerAction.UPDATE,
        'index': index,
        'customer': entity,
      },
    ).then((_) => init());
  }

  deleteCustomer(int index) async {
    _state = ResultState.LOADING;
    notifyListeners();
    try {
      _state = ResultState.SUCCESS;
      await locator<CustomerDao>().delete(index);
      _getCustomers();
      notifyListeners();
    } catch (e) {
      _state = ResultState.ERROR;
      debugPrint('Error : $e');
    }
  }
}

enum CustomerAction {
  ADD,
  UPDATE,
}
