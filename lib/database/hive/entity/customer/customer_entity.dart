import 'package:desktop_base/database/hive/fields/customer_fields.dart';
import 'package:desktop_base/database/hive/hive_box.dart';
import 'package:hive/hive.dart';

part 'customer_entity.g.dart';

@HiveType(typeId: HiveBox.customerType)
class CustomerEntity extends HiveObject {

  @HiveField(CustomerFields.name)
  final String? name;

  @HiveField(CustomerFields.phone)
  final String? phone;

  @HiveField(CustomerFields.email)
  final String? email;

  @HiveField(CustomerFields.address)
  final String? address;

  @HiveField(CustomerFields.role)
  final String? role;

  CustomerEntity({
    this.name,
    this.phone,
    this.email,
    this.address,
    this.role,
  });
}