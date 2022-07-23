import 'package:desktop_base/database/hive/entity/customer/customer_entity.dart';
import 'package:desktop_base/database/hive/hive_box.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CustomerDao {
  final box = Hive.box(HiveBox.customer);

  add(CustomerEntity entity) {
    box.add(entity);
    debugPrint('Successfully create customer');
    debugPrint('============================');
  }

  update(int index, CustomerEntity entity) {
    box.putAt(index, entity);
    debugPrint('Successfully update customer');
    debugPrint('=============================');
  }

  List<CustomerEntity> getAll() {
    List<CustomerEntity> datas = [];
    for (var i = 0; i < box.length; i++) {
      datas.add(box.getAt(i));
    }
    return datas;
  }

  delete(int index){
    box.deleteAt(index);
  }
}