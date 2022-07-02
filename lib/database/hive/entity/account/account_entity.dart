import 'dart:convert';

import 'package:hive/hive.dart';

part 'account_entity.g.dart';

String accountToJson(AccountEntity data) => json.encode(data.toJson());
AccountEntity accountFromJson(String str) => AccountEntity.fromJson(json.decode(str));

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

  factory AccountEntity.fromJson(Map<dynamic, dynamic> json) {
    return AccountEntity(
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      address: json['address'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone": phone,
    "email": email,
    "address": address,
    "role": role,
  };
}
