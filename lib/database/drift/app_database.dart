import 'dart:io';

import 'package:desktop_base/database/drift/dao/product/product_dao.dart';
import 'package:desktop_base/database/drift/dao/transaction/transaction_dao.dart';
import 'package:desktop_base/database/drift/entity/product_entity.dart';
import 'package:desktop_base/database/drift/entity/transaction_entity.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [ProductEntity, TransactionEntity],
  daos: [ProductDao, TransactionDao],
)
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
}

AppDatabase dbConnection({bool logStatements = false}) {
  if (Platform.isMacOS || Platform.isWindows) {
    final executor = LazyDatabase(() async {
      final dataDir = await getApplicationDocumentsDirectory();
      final dbFile = File(p.join(dataDir.path, 'warfi.sqlite'));
      return NativeDatabase(dbFile, logStatements: logStatements);
    });
    return AppDatabase(executor);
  }
  return AppDatabase(NativeDatabase.memory(logStatements: logStatements));
}
