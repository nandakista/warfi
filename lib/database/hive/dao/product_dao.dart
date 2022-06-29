import 'package:desktop_base/database/hive/entity/product/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ProductDao {
  final box = Hive.box('productBox');

  add(ProductEntity entity) {
    box.put(entity.id, entity);
    debugPrint('Successfully added product');
    debugPrint('============================');
  }

  update(ProductEntity entity) {
    ProductEntity oldProduct = box.get(entity.id);
    final newProduct = ProductEntity(
      id: oldProduct.id,
      name: oldProduct.name,
      price: entity.price,
      createdAt: oldProduct.createdAt,
      updateAt: DateTime.now(),
      pcs: oldProduct.pcs! + entity.pcs!,
      pack: oldProduct.pack! + entity.pack!,
      bal: oldProduct.bal! + entity.bal!,
      dus: oldProduct.dus! + entity.dus!,
    );
    box.put(entity.id, newProduct);
    debugPrint('Successfully update product');
    debugPrint('=============================');
  }

  List<ProductEntity> getAll() {
    List<ProductEntity> products = [];
    for (var i = 0; i < box.length; i++) {
      products.add(box.getAt(i));
    }
    return products;
  }

  addOrUpdate(ProductEntity entity) {
    Iterable keys = box.keys;
    if (keys.contains(entity.id)) {
      update(entity);
    } else {
      add(entity);
    }
  }

  delete(ProductEntity entity){
    box.delete(entity.id);
  }

  deleteAll() {
    box.deleteAll(box.keys);
    debugPrint('Successfully clear all product');
    debugPrint('================================');
  }
}
