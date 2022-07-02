import 'package:desktop_base/database/hive/entity/account/account_entity.dart';
import 'package:desktop_base/database/hive/entity/customer/customer_entity.dart';
import 'package:desktop_base/database/hive/entity/product/product_entity.dart';
import 'package:hive/hive.dart';

part 'recap_entity.g.dart';

@HiveType(typeId: 4)
class RecapEntity extends HiveObject {
  @HiveField(0)
  final List<ProductEntity> listProduct;

  @HiveField(1)
  final AccountEntity person;

  @HiveField(2)
  final CustomerEntity customer;

  @HiveField(3)
  final String? note;

  @HiveField(4)
  final int debt;

  @HiveField(5)
  final DateTime createdAt;

  RecapEntity({
    required this.listProduct,
    required this.createdAt,
    required this.person,
    required this.note,
    required this.debt,
    required this.customer,
  });
}
