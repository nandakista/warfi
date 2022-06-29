import 'package:desktop_base/database/drift/app_database.dart';
import 'package:desktop_base/database/drift/entity/product_entity.dart';
import 'package:drift/drift.dart';

part 'product_dao.g.dart';

@DriftAccessor(tables: [ProductEntity])
class ProductDao extends DatabaseAccessor<AppDatabase> with _$ProductDaoMixin {
  ProductDao(AppDatabase db) : super(db);

  Future<List<ProductEntityData>> getAllProduct() async => await select(productEntity).get();
  Future<ProductEntityData> getProduct(String id) async => await (select(productEntity)..where((tbl) => tbl.idName.equals(id))).getSingle();
  Future insertProduct(ProductEntityCompanion product) async => await into(productEntity).insert(product);
  // Future updateProduct(String id, ProductEntityCompanion product) async => await (update(productEntity)..where((tbl) => tbl.idName.like(id))).replace(product);

  Future updateProduct(String id, ProductEntityCompanion product) async => await update(productEntity).replace(product);
  Future deleteProduct(String id) async => await (delete(productEntity)..where((tbl) => tbl.idName.equals(id))).go();
}