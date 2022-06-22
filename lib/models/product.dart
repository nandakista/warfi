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

List<Product> dummyProduct = [
  Product(name: 'Roma Biscuit', quantity: Quantity(bal: 112, box: 2, lusin: 0, pack: 0, pcs: 1232), price: 12000),
  Product(name: 'Rinso', quantity: Quantity(bal: 2, box: 4, lusin: 0, pack: 0, pcs: 0), price: 32000),
  Product(name: 'Sabun Lifebuoy', quantity: Quantity(bal: 4, box: 0, lusin: 2, pack: 0, pcs: 2), price: 4500),
  Product(name: 'Shampo', quantity: Quantity(bal: 3, box: 0, lusin: 0, pack: 0, pcs: 9), price: 22000)
];
