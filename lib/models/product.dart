import 'dart:convert';
import 'package:desktop_base/models/quantity.dart';

String productsToJson(List<Product> data) => json.encode(data);
List<Product> productsFromJson(String? str) => json.decode(str!).map((e) => Product.fromJson(e)).toList().cast<Product>();

class Product {
  final String? name;
  final int? price;
  final Quantity? quantity;
  final DateTime? createdAt;
  final DateTime? updateAt;

  Product({
    this.name,
    this.price,
    this.quantity,
    this.createdAt,
    this.updateAt,
  });

  factory Product.fromJson(Map<dynamic, dynamic> json) {
    return Product(
      name: json['product_name'],
      price: json['product_price'],
      createdAt: json['created_at'],
      updateAt: json['update_at'],
      quantity: Quantity.fromJson(json['quantity']),
    );
  }

  Map<String, dynamic> toJson() => {
        "product_name": name,
        "product_price": price,
        "created_at": createdAt,
        "update_at": updateAt,
      };
}