import 'package:desktop_base/database/hive/entity/account/account_entity.dart';
import 'package:desktop_base/database/hive/entity/product/product_entity.dart';
import 'package:hive/hive.dart';

part 'transaction_entity.g.dart';

@HiveType(typeId: 1)
class TransactionEntity extends HiveObject {
  @HiveField(0)
  final ProductEntity? product;

  @HiveField(1)
  final DateTime? createdAt;

  @HiveField(2)
  final DateTime? updateAt;

  @HiveField(3)
  final String? note;

  @HiveField(4)
  final AccountEntity account;

  TransactionEntity({
    required this.product,
    this.createdAt,
    this.updateAt,
    this.note,
    required this.account,
  });
}
