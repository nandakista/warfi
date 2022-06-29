import 'package:desktop_base/app/app_config.dart';
import 'package:desktop_base/database/hive/dao/product_dao.dart';
import 'package:desktop_base/database/hive/dao/transaction_dao.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance;
class AppServices {
  static Future init() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    locator.registerLazySingleton(() => sharedPreferences);
    locator.registerLazySingleton(() => AppConfig());
    locator.registerLazySingleton(() => ProductDao());
    locator.registerLazySingleton(() => TransactionDao());
  }
}
