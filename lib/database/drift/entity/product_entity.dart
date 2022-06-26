import 'package:drift/drift.dart';

class ProductEntity extends Table {
  TextColumn get idName => text()();
  TextColumn get name => text()();
  IntColumn get price => integer()();
  IntColumn get box => integer()();
  IntColumn get bal => integer()();
  IntColumn get pack => integer()();
  IntColumn get pcs => integer()();


  @override
  Set<Column> get primaryKey => {name};
}