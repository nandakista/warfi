import 'package:desktop_base/database/hive/entity/account/account_entity.dart';

enum AccountRole {
  admin,
  employee,
}

AccountEntity admin = AccountEntity(
  name: 'Admin',
  address: '-',
  email: 'nanda.kista@gmail.com',
  phone: '08985953469',
  role: AccountRole.admin.toString(),
);

AccountEntity employee1 = AccountEntity(
  name: 'Farrel',
  address: '-',
  email: 'farrel@gmail.com',
  phone: '081288997788',
  role: AccountRole.employee.toString(),
);