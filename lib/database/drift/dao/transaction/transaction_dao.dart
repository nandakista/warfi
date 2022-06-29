import 'package:desktop_base/database/drift/app_database.dart';
import 'package:desktop_base/database/drift/entity/transaction_entity.dart';
import 'package:drift/drift.dart';

part 'transaction_dao.g.dart';

@DriftAccessor(tables: [TransactionEntity])
class TransactionDao extends DatabaseAccessor<AppDatabase> with _$TransactionDaoMixin {
  TransactionDao(AppDatabase db) : super(db);

  Future<List<TransactionEntityData>> getAllTransaction() async => await select(transactionEntity).get();
  Future createTransaction(TransactionEntityCompanion transaction) async => await into(transactionEntity).insert(transaction);
}