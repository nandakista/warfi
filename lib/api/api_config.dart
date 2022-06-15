import 'package:desktop_base/api/api_interceptor.dart';
import 'package:desktop_base/app/app_config.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

final Dio dioClient = Get.find<DioClient>().init();
class DioClient {
  static String baseURL = AppConfig.to.get.baseUrl;

  Dio init() {
    Dio _dio = Dio();
    _dio.options.baseUrl = baseURL;
    _dio.options.connectTimeout = 60 * 1000; //60s
    _dio.options.receiveTimeout = 3 * 1000; //3s
    return _dio;
  }

  static setInterceptor(){
    dioClient.interceptors.clear();
    dioClient.interceptors.add(ApiInterceptors(dioClient));
  }
}