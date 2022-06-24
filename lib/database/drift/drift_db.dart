import 'dart:io';

import 'package:desktop_base/database/drift/entity/product_entity.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'drift_db.g.dart';

@DriftDatabase(tables: [ProductEntity])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) {
        return m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {},
      beforeOpen: (details) async {},
    );
  }

  // --------- <Product Dao> -------------
  Future<List<ProductEntityData>> getAllProduct() async => await select(productEntity).get();
  Future<ProductEntityData> getProduct(int id) async => await (select(productEntity)..where((tbl) => tbl.id.equals(id))).getSingle();
  Stream<List<ProductEntityData>> watchAllProduct() => select(productEntity).watch();
  Future insertProduct(ProductEntityCompanion product) async => await into(productEntity).insert(product);
  Future updateProduct(ProductEntityCompanion product) async => await update(productEntity).replace(product);
  Future deleteProduct(int id) async => await (delete(productEntity)..where((tbl) => tbl.id.equals(id))).go();
  Future deleteAll(ProductEntityCompanion product) async => await (delete(productEntity).delete(product));
}

AppDatabase openConnection({bool logStatements = false}) {
  if (Platform.isMacOS || Platform.isWindows) {
    final executor = LazyDatabase(() async {
      final dataDir = await getApplicationDocumentsDirectory();
      final dbFile = File(p.join(dataDir.path, 'products.sqlite'));
      return NativeDatabase(dbFile, logStatements: logStatements);
    });
    return AppDatabase(executor);
  }
  return AppDatabase(NativeDatabase.memory(logStatements: logStatements));
}