import 'package:desktop_base/database/drift/entity/product_entity.dart';
import 'package:drift/drift.dart';

class TransactionEntity extends Table {
  TextColumn get idName => text()();
  TextColumn get createdAt => text()();
  TextColumn get deletedAt => text()();
  TextColumn get name => text()();
  IntColumn get price => integer()();
  IntColumn get box => integer()();
  IntColumn get bal => integer()();
  IntColumn get pack => integer()();
  IntColumn get pcs => integer()();


  @override
  Set<Column> get primaryKey => {name};
}