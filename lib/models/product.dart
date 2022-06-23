import 'package:desktop_base/models/quantity.dart';

class Product {
  final String? name;
  final int? price;
  // final String? description;
  // final String? image;
  final Quantity? quantity;
  final DateTime? createdAt;
  final DateTime? updateAt;

  Product({
    this.name,
    this.price,
    // this.description,
    // this.image,
    this.quantity,
    this.createdAt,
    this.updateAt,
  });

  factory Product.fromJson(Map<dynamic, dynamic> json) {
    return Product(
      name: json['product_name'],
      price: json['product_price'],
      // description: json['description'],
      // image: json['product_image'],
      createdAt: json['created_at'],
      updateAt: json['update_at'],
    );
  }

  Map<String, dynamic> toJson() => {
        "product_name": name,
        "product_price": price,
        // "description": description,
        // "product_image": image,
        "created_at": createdAt,
        "update_at": updateAt,
      };
}

List<Product> dummyProduct = [
  Product(
    name: 'Roma Biscuit',
    quantity: Quantity(bal: 112, box: 2, lusin: 0, pack: 0, pcs: 1232),
    price: 12000,
  ),
  Product(
    name: 'Rinso',
    quantity: Quantity(bal: 2, box: 4, lusin: 0, pack: 0, pcs: 0),
    price: 32000,
  ),
  Product(
    name: 'Sabun Lifebuoy',
    quantity: Quantity(bal: 4, box: 0, lusin: 2, pack: 0, pcs: 2),
    price: 4500,
  ),
  Product(
    name: 'Shampo',
    quantity: Quantity(bal: 3, box: 0, lusin: 0, pack: 0, pcs: 9),
    price: 22000,
  )
];
