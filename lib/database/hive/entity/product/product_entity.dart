import 'package:desktop_base/database/hive/fields/product_fields.dart';
import 'package:desktop_base/database/hive/hive_box.dart';
import 'package:hive/hive.dart';

part 'product_entity.g.dart';

@HiveType(typeId: HiveBox.productType)
class ProductEntity extends HiveObject {
  // id format == name product with lower snake_case
  @HiveField(ProductFields.id)
  final String id;

  @HiveField(ProductFields.name)
  final String? name;

  @HiveField(ProductFields.price)
  final int? price;

  @HiveField(ProductFields.dus)
  final int? dus;

  @HiveField(ProductFields.bal)
  final int? bal;

  @HiveField(ProductFields.pack)
  final int? pack;

  @HiveField(ProductFields.pcs)
  final int? pcs;

  @HiveField(ProductFields.createdAt)
  final DateTime? createdAt;

  @HiveField(ProductFields.updateAt)
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
