import 'dart:convert';

import 'package:desktop_base/database/hive/fields/account_fields.dart';
import 'package:desktop_base/database/hive/hive_box.dart';
import 'package:hive/hive.dart';

part 'account_entity.g.dart';

String accountToJson(AccountEntity data) => json.encode(data.toJson());
AccountEntity accountFromJson(String str) => AccountEntity.fromJson(json.decode(str));

@HiveType(typeId: HiveBox.accountType)
class AccountEntity extends HiveObject {

  @HiveField(AccountFields.name)
  final String? name;

  @HiveField(AccountFields.phone)
  final String? phone;

  @HiveField(AccountFields.email)
  final String? email;

  @HiveField(AccountFields.address)
  final String? address;

  @HiveField(AccountFields.role)
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
