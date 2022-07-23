import 'package:desktop_base/app/app_service.dart';
import 'package:desktop_base/database/hive/dao/recap_dao.dart';
import 'package:desktop_base/database/hive/entity/recap/recap_entity.dart';
import 'package:desktop_base/features/transaction/out/form/transaction_out_form.dart';
import 'package:desktop_base/helper/provider_state.dart';
import 'package:flutter/material.dart';

class HistoryOutProvider with ChangeNotifier {

  List<RecapEntity> _listRecap = [];
  List<RecapEntity> get listRecap => _listRecap;

  late ResultState _state;
  ResultState get state => _state;

  String _message = '';
  String get message => _message;

  HistoryOutProvider init() {
    _getRecap();
    return this;
  }

  Future<dynamic> _getRecap() async {
    _state = ResultState.LOADING;
    notifyListeners();
    try {
      final data = locator<RecapDao>().getAll();
      if(data.isNotEmpty) {
        _state = ResultState.SUCCESS;
        notifyListeners();
        return _listRecap = data;
      } else {
        _state = ResultState.EMPTY;
        notifyListeners();
        return _message = 'Anda belum \nmenambahkan Pengeluaran';
      }
    } catch (e) {
      _state = ResultState.ERROR;
      debugPrint("Error : $e");
      return _message = 'Error --> $e';
    }
  }

  toCreateTransaction(BuildContext context) async {
    return Navigator.pushNamed(context, TransactionOutForm.route);
  }
}