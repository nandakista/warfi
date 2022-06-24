import 'package:drift/drift.dart';

class ProductEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get price => integer()();
  IntColumn get box => integer()();
  IntColumn get bal => integer()();
  IntColumn get pack => integer()();
  IntColumn get pcs => integer()();
}