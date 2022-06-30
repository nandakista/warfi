import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class AppConverter {
  static String toBase64({File? file}) {
    try {
      if (file != null) {
        final bytes = File(file.path).readAsBytesSync();
        String file64Path = base64Encode(bytes);
        debugPrint('toBase64 Success');
        return file64Path;
      } else {
        return 'Anda belum memilih file';
      }
    } catch (e) {
      debugPrint('toBase64 Exception : ${e.toString()}');
      return e.toString();
    }
  }

  static String replaceCharAt(String oldString, int index, String newChar) {
    return oldString.substring(0, index) +
        newChar +
        oldString.substring(index + 1);
  }
}

extension StringExtension on String {
  String capitalize() {
    return split(' ')
        .map((e) => '${e[0].toUpperCase()}${e.substring(1)}')
        .join(' ');
  }

  String toSnakeCase() {
    return replaceAll(' ', '_')
        .toLowerCase()
        .split(' ')
        .map((e) => '${e[0].toLowerCase()}${e.substring(1)}')
        .join(' ');
  }

  String snakeToNormalCase() {
    return replaceAll('_', ' ')
        .toLowerCase()
        .split(' ')
        .map((e) => '${e[0]}${e.substring(1)}')
        .join(' ');
  }

  int fromIDRtoInt() {
    return int.tryParse(substring(3, length).replaceAll('.', '')) ?? 0;
  }
}

extension IntExtension on int {
  String toIDR() {
    return NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0)
        .format(this);
  }
}
