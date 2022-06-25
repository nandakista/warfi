import 'package:desktop_base/api/api_config.dart';
import 'package:desktop_base/app/app_config.dart';
import 'package:desktop_base/database/drift/dao/product_dao.dart';
import 'package:desktop_base/database/drift/drift_db.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance;
class AppServices {
  static Future init() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    locator.registerLazySingleton(() => sharedPreferences);
    locator.registerLazySingleton(() => openConnection());
    locator.registerLazySingleton(() => AppConfig());
    locator.registerLazySingleton(() => DioClient());

    // Dao
    locator.registerLazySingleton(() => ProductDao(openConnection()));
  }
}
