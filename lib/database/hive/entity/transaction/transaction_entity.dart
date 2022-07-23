import 'package:desktop_base/database/hive/entity/account/account_entity.dart';
import 'package:desktop_base/database/hive/entity/product/product_entity.dart';
import 'package:desktop_base/database/hive/fields/transaction_fields.dart';
import 'package:desktop_base/database/hive/hive_box.dart';
import 'package:hive/hive.dart';

part 'transaction_entity.g.dart';

@HiveType(typeId: HiveBox.transactionType)
class TransactionEntity extends HiveObject {

  @HiveField(TransactionFields.product)
  final ProductEntity? product;

  @HiveField(1)
  @HiveField(TransactionFields.createdAt)
  final DateTime? createdAt;

  @HiveField(2)
  @HiveField(TransactionFields.updateAt)
  final DateTime? updateAt;

  @HiveField(3)
  @HiveField(TransactionFields.note)
  final String? note;

  @HiveField(4)
  @HiveField(TransactionFields.account)
  final AccountEntity account;

  TransactionEntity({
    required this.product,
    this.createdAt,
    this.updateAt,
    this.note,
    required this.account,
  });
}
