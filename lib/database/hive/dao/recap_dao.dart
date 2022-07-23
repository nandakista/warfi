import 'package:desktop_base/database/hive/entity/recap/recap_entity.dart';
import 'package:desktop_base/database/hive/hive_box.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class RecapDao{
  final box = Hive.box(HiveBox.recap);

  add(RecapEntity entity) {
    box.add(entity);
    debugPrint('Successfully create recap');
    debugPrint('============================');
  }

  List<RecapEntity> getAll() {
    List<RecapEntity> datas = [];
    for (var i = 0; i < box.length; i++) {
      datas.add(box.getAt(i));
    }
    return datas;
  }
}