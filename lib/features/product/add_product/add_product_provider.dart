import 'package:flutter/material.dart';

class AddProductProvider with ChangeNotifier{
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final boxController = TextEditingController();
  final pcsController = TextEditingController();
  final balController = TextEditingController();
  final packController = TextEditingController();
  String? result;

  setResult(){
    // result = controller.text;
    notifyListeners();
  }
}