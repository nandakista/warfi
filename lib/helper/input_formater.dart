import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  static TextEditingValue defaultFormat(String text) {
    return CurrencyInputFormatter().formatEditUpdate(
      const TextEditingValue(text: ''),
      TextEditingValue(text: text),
    );
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      debugPrint(true.toString());
      return newValue;
    }

    double value = double.parse(newValue.text);
    final formatter =
        NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0);
    String newText = formatter.format(value);
    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}
