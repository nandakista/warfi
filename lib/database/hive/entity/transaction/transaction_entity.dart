import 'package:desktop_base/database/hive/entity/account/account_entity.dart';
import 'package:hive/hive.dart';

part 'transaction_entity.g.dart';

@HiveType(typeId: 1)
class TransactionEntity extends HiveObject {
  // id format == name product with lower snake_case
  @HiveField(0)
  final String? name;

  @HiveField(1)
  final int? price;

  @HiveField(2)
  final int? dus;

  @HiveField(3)
  final int? bal;

  @HiveField(4)
  final int? pack;

  @HiveField(5)
  final int? pcs;

  @HiveField(6)
  final DateTime? createdAt;

  @HiveField(7)
  final DateTime? updateAt;


  @HiveField(8)
  final String? note;

  @HiveField(9)
  final AccountEntity? account;

  TransactionEntity({
    this.name,
    this.price,
    this.createdAt,
    this.updateAt,
    this.dus,
    this.bal,
    this.pack,
    this.pcs,
    this.note,
    this.account,
  });
}
