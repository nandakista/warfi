import 'package:desktop_base/database/drift/entity/product_entity.dart';
import 'package:drift/drift.dart';

class TransactionEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get idProduct => text().references(ProductEntity, #idName)();
  TextColumn get createdAt => text()();
  TextColumn get deletedAt => text()();
}