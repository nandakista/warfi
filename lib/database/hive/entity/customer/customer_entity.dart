import 'package:hive/hive.dart';

part 'customer_entity.g.dart';

@HiveType(typeId: 5)
class CustomerEntity extends HiveObject {
  @HiveField(0)
  final String? name;

  @HiveField(1)
  final String? phone;

  @HiveField(2)
  final String? email;

  @HiveField(3)
  final String? address;

  @HiveField(4)
  final String? role;

  CustomerEntity({
    this.name,
    this.phone,
    this.email,
    this.address,
    this.role,
  });
}