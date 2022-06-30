import 'package:hive/hive.dart';

part 'product_entity.g.dart';

@HiveType(typeId: 0)
class ProductEntity extends HiveObject {
  // id format == name product with lower snake_case
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String? name;

  @HiveField(2)
  final int? price;

  @HiveField(3)
  final int? dus;

  @HiveField(4)
  final int? bal;

  @HiveField(5)
  final int? pack;

  @HiveField(6)
  final int? pcs;

  @HiveField(7)
  final DateTime? createdAt;

  @HiveField(8)
  final DateTime? updateAt;

  ProductEntity({
    required this.id,
    this.name,
    this.price,
    this.createdAt,
    this.updateAt,
    this.dus,
    this.bal,
    this.pack,
    this.pcs,
  });
}
