import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class AppFunction {
  static Future<String> getFileSize(String filepath, int decimals) async {
    var file = File(filepath);
    int bytes = await file.length();
    debugPrint('Path : $filepath');
    debugPrint('Size : $bytes');
    if (bytes <= 0) return '0 B';
    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i];
  }


  // Download File
  static Future<File> downloadFile(
      {required String url, bool useToken = false, name}) async {
    var fileName = 'downloaded_file';
    if (name != null) {
      fileName = name;
    }
    try {
      // if (useToken) {
      //   var apiToken = LocalStorage.to.isLoggedIn() ? LocalStorage.to.getToken() : null;
      //   headers[HttpHeaders.authorizationHeader] = 'Bearer $apiToken';
      // } else {
      //   headers.clear();
      // }
      final rs = await Dio().get<List<int>>(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          // headers: headers,
        ),
      );
      var dir = await getApplicationDocumentsDirectory();
      File file = File('${dir.path}/' + fileName + '.pdf');
      File urlFile = await file.writeAsBytes(rs.data!);
      return urlFile;
    } catch (e) {
      debugPrint('Error : $e');
      throw Exception('Error opening url file');
    }
  }

  static Future<String> downloadFilePath(String url, String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/$fileName';
    await Dio().download(url, filePath);
    return filePath;
  }


  static Future<File?> pickFile(BuildContext context, String type) async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (result != null) {
      File file = File(result.files.single.path!);
      return file;
    }
    return null;
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
