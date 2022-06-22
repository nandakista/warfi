import 'package:flutter/services.dart';

class CustomInputFormatters {
  static List<TextInputFormatter>? numberOnly = [
    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,1}')),
    TextInputFormatter.withFunction(
          (oldValue, newValue) => newValue.copyWith(
        text: newValue.text.replaceAll(',', '.'),
      ),
    ),
  ];
}
