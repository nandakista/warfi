import 'package:desktop_base/models/quantity.dart';

class Product {
  final String? name;
  final int? price;
  final String? description;
  final Quantity? quantity;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updateAt;

  Product({
    this.name,
    this.price,
    this.description,
    this.quantity,
    this.image,
    this.createdAt,
    this.updateAt,
  });
}
