import 'package:hive/hive.dart';

@HiveType(typeId: 3)
class AccountEntity extends HiveObject {
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

  AccountEntity({
    this.name,
    this.phone,
    this.email,
    this.address,
    this.role,
  });
}
