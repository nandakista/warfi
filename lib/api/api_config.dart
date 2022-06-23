import 'package:desktop_base/api/api_interceptor.dart';
import 'package:desktop_base/app/app_config.dart';
import 'package:desktop_base/app/app_service.dart';
import 'package:dio/dio.dart';

final Dio dioClient = locator<DioClient>().init();
class DioClient {
  static String baseURL = AppConfig.to.get.baseUrl;

  Dio init() {
    Dio dio = Dio();
    dio.options.baseUrl = baseURL;
    dio.options.connectTimeout = 60 * 1000; //60s
    dio.options.receiveTimeout = 3 * 1000; //3s
    return dio;
  }

  static setInterceptor(){
    dioClient.interceptors.clear();
    dioClient.interceptors.add(ApiInterceptors(dioClient));
  }
}