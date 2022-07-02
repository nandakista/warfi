import 'package:desktop_base/database/hive/entity/account/account_entity.dart';
import 'package:desktop_base/database/hive/entity/product/product_entity.dart';
import 'package:desktop_base/database/hive/entity/transaction/transaction_entity.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveDB {
  static Future init() async {
    Hive.registerAdapter(AccountEntityAdapter());
    Hive.registerAdapter(ProductEntityAdapter());
    Hive.registerAdapter(TransactionEntityAdapter());

    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);

    await Hive.openBox('productBox');
    await Hive.openBox('transactionBox');
  }
}

