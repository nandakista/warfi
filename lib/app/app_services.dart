import 'package:desktop_base/app/app_config.dart';
import 'package:desktop_base/database/get_storage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppServices extends GetxService {
  static Future<void> init() async {
    await Get.putAsync<SharedPreferences>(
            () async => await SharedPreferences.getInstance(),
        permanent: true);
    Get.lazyPut(() => AppConfig());
    // Get.lazyPut(() => DioClient());
    Get.put(LocalStorage(), permanent: true);
  }
}
