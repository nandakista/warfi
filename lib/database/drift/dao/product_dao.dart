import 'package:desktop_base/database/drift/drift_db.dart';
import 'package:desktop_base/database/drift/entity/product_entity.dart';
import 'package:drift/drift.dart';

part 'product_dao.g.dart';

@DriftAccessor(tables: [ProductEntity])
class ProductDao extends DatabaseAccessor<AppDatabase> with _$ProductDaoMixin {
  // ProductDao(super.attachedDatabase);
  ProductDao(AppDatabase db) : super(db);

  Future<List<ProductEntityData>> getAllProduct() async => await select(productEntity).get();
  Future<ProductEntityData> getProduct(int id) async => await (select(productEntity)..where((tbl) => tbl.id.equals(id))).getSingle();
  Stream<List<ProductEntityData>> watchAllProduct() => select(productEntity).watch();
  Future insertProduct(ProductEntityCompanion product) async => await into(productEntity).insert(product);
  Future updateProduct(ProductEntityCompanion product) async => await update(productEntity).replace(product);
  Future deleteProduct(int id) async => await (delete(productEntity)..where((tbl) => tbl.id.equals(id))).go();
  Future deleteAll(ProductEntityCompanion product) async => await (delete(productEntity).delete(product));
}