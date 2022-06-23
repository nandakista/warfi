import 'dart:convert';
import 'dart:io';

import 'package:desktop_base/api/api_config.dart';
import 'package:desktop_base/api/api_exception.dart';
import 'package:desktop_base/api/api_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

enum RequestMethod { GET, POST, PATCH, PUT, DELETE }

Map<String, String> headers = {
  HttpHeaders.authorizationHeader: '',
};

Future<ApiResponse> sendRequest({
  required String url,
  Object? body,
  required RequestMethod requestMethod,
  bool useToken = false,
  String? contentType = Headers.jsonContentType,
}) async {
  DioClient.setInterceptor();
  // var apiToken = LocalStorage.to.isLoggedIn() ? LocalStorage.to.getToken() : null;
  var apiToken = '';
  if (useToken) {
    headers[HttpHeaders.authorizationHeader] = 'Bearer $apiToken';
  } else {
    headers.clear();
  }
  try {
    Response response;
    switch (requestMethod) {
      case RequestMethod.POST:
        try {
          debugPrint('Request Body : ${FormData.fromMap(body as Map<String, dynamic>).fields}');
          response = await dioClient.post(
            url,
            data: contentType == Headers.jsonContentType
                ? jsonEncode(body)
                : FormData.fromMap(body),
            options: Options(headers: headers, contentType: contentType),
          );
        } on SocketException {
          throw 'Tidak ada koneksi internet!';
        } on DioError catch (error) {
          throw DioException.message(error);
        }
        break;
      case RequestMethod.GET:
        try {
          response = await dioClient.get(
            url,
            options: Options(contentType: contentType, headers: headers),
          );
        } on SocketException {
          throw 'Tidak ada koneksi internet!';
        } on DioError catch (error) {
          throw DioException.message(error);
        }
        break;
      case RequestMethod.PATCH:
        try {
          response = await dioClient.patch(
            url,
            data: contentType == Headers.jsonContentType
                ? jsonEncode(body)
                : FormData.fromMap(body as Map<String, dynamic>),
            options: Options(headers: headers, contentType: contentType),
          );
        } on SocketException {
          throw 'Tidak ada koneksi internet!';
        } on DioError catch (error) {
          throw DioException.message(error);
        }
        break;
      case RequestMethod.PUT:
        try {
          response = await dioClient.put(
            url,
            data: contentType == Headers.jsonContentType
                ? jsonEncode(body)
                : FormData.fromMap(body as Map<String, dynamic>),
            options: Options(headers: headers, contentType: contentType),
          );
        } on SocketException {
          throw 'Tidak ada koneksi internet!';
        } on DioError catch (error) {
          throw DioException.message(error);
        }
        break;
      case RequestMethod.DELETE:
        try {
          response = await dioClient.delete(
            url,
            options: Options(headers: headers),
          );
        } on SocketException {
          throw 'Tidak ada koneksi internet!';
        } on DioError catch (error) {
          throw DioException.message(error);
        }
        break;
    }
    return ApiResponse.fromJson(response.data);
  } catch (error) {
    rethrow;
  }
}