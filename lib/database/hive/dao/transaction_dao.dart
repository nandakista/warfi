import 'package:desktop_base/database/hive/entity/transaction/transaction_entity.dart';
import 'package:desktop_base/database/hive/hive_box.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class TransactionDao{
  final box = Hive.box(HiveBox.transaction);

  add(TransactionEntity entity) {
    box.add(entity);
    debugPrint('Successfully create transaction');
    debugPrint('============================');
  }

  List<TransactionEntity> getAll() {
    List<TransactionEntity> products = [];
    for (var i = 0; i < box.length; i++) {
      products.add(box.getAt(i));
    }
    return products;
  }
}