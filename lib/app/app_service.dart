import 'package:desktop_base/app/app_config.dart';
import 'package:desktop_base/database/drift/dao/product/product_dao.dart';
import 'package:desktop_base/database/drift/dao/transaction/transaction_dao.dart';
import 'package:desktop_base/database/drift/app_database.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance;
class AppServices {
  static Future init() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    locator.registerLazySingleton(() => sharedPreferences);
    locator.registerLazySingleton(() => dbConnection());
    locator.registerLazySingleton(() => AppConfig());

    // Dao
    final database = locator<AppDatabase>();
    locator.registerLazySingleton(() => ProductDao(database));
    locator.registerLazySingleton(() => TransactionDao(database));
  }
}
