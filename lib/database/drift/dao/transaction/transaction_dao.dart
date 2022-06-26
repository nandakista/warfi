import 'package:desktop_base/database/drift/app_database.dart';
import 'package:desktop_base/database/drift/entity/product_entity.dart';
import 'package:desktop_base/database/drift/entity/transaction_entity.dart';
import 'package:drift/drift.dart';

part 'transaction_dao.g.dart';

@DriftAccessor(tables: [TransactionEntity, ProductEntity])
class TransactionDao extends DatabaseAccessor<AppDatabase> with _$TransactionDaoMixin {
  TransactionDao(AppDatabase db) : super(db);

  Future<List<TransactionEntityData>> getAllTransaction() async => await select(transactionEntity).get();
  Future createTransaction(TransactionEntityCompanion transaction) async => await into(transactionEntity).insert(transaction);

  // Stream<List<Recap>> watchRecap() {
  //   final query = select(transactionEntity).join([
  //     leftOuterJoin(productEntity,
  //         productEntity.idName.equalsExp(transactionEntity.idProduct))
  //   ]);
  //   return query.watch().map((rows) {
  //     return rows.map((row) {
  //       return Recap(
  //         row.readTable(transactionEntity),
  //         row.readTable(productEntity),
  //       );
  //     }).toList();
  //   });
  // }

  Future<List<Recap>> getRecap() {
    final query = select(transactionEntity).join([
      leftOuterJoin(
        productEntity,
        productEntity.idName.equalsExp(
          transactionEntity.idProduct,
        ),
      ),
    ]);
    return query.get().then((rows) {
      return rows.map((row) {
        return Recap(
          row.readTableOrNull(transactionEntity),
          row.readTableOrNull(productEntity),
        );
      }).toList();
    });
  }
}

class Recap {
  Recap(this.transaction, this.product);

  final ProductEntityData? product;
  final TransactionEntityData? transaction;
}