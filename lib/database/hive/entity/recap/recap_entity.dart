import 'package:desktop_base/database/hive/entity/account/account_entity.dart';
import 'package:desktop_base/database/hive/entity/customer/customer_entity.dart';
import 'package:desktop_base/database/hive/entity/product/product_entity.dart';
import 'package:desktop_base/database/hive/fields/recap_fields.dart';
import 'package:desktop_base/database/hive/hive_box.dart';
import 'package:hive/hive.dart';

part 'recap_entity.g.dart';

@HiveType(typeId: HiveBox.recapType)
class RecapEntity extends HiveObject {

  @HiveField(RecapFields.listProduct)
  final List<ProductEntity> listProduct;

  @HiveField(RecapFields.person)
  final AccountEntity account;

  @HiveField(RecapFields.customer)
  final CustomerEntity customer;

  @HiveField(RecapFields.note)
  final String? note;

  @HiveField(RecapFields.debt)
  final int debt;

  @HiveField(RecapFields.createdAt)
  final DateTime createdAt;

  RecapEntity({
    required this.listProduct,
    required this.createdAt,
    required this.account,
    required this.note,
    required this.debt,
    required this.customer,
  });
}
