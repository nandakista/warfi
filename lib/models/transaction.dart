import 'dart:convert';

String transactionsToJson(List<Transaction> data) => json.encode(data);
List<Transaction> transactionsFromJson(String? str) => json.decode(str!).map((e) => Transaction.fromJson(e)).toList().cast<Transaction>();

class Transaction {
  final String? name;
  final int? price;
  final DateTime? createdAt;
  final DateTime? updateAt;
  final int? box;
  final int? bal;
  final int? pack;
  final int? pcs;
  final int? lusin;

  Transaction({
    this.box,
    this.bal,
    this.pack,
    this.pcs,
    this.lusin,
    this.name,
    this.price,
    this.createdAt,
    this.updateAt,
  });

  factory Transaction.fromJson(Map<dynamic, dynamic> json) {
    return Transaction(
      name: json['product_name'],
      price: json['product_price'],
      createdAt: json['created_at'],
      updateAt: json['update_at'],
      bal: json['bal'],
      box: json['box'],
      lusin: json['lusin'],
      pack: json['pack'],
      pcs: json['pcs'],
    );
  }

  Map<String, dynamic> toJson() => {
        "product_name": name,
        "product_price": price,
        "created_at": createdAt,
        "update_at": updateAt,
        'bal': bal,
        'box': box,
        'lusin': lusin,
        'pack': pack,
        'pcs': pcs,
      };
}
