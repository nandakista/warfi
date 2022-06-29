class Quantity {
  final int? box;
  final int? bal;
  final int? pack;
  final int? pcs;
  final int? lusin;

  Quantity({
    this.box,
    this.bal,
    this.pack,
    this.pcs,
    this.lusin,
  });

  factory Quantity.fromJson(Map<dynamic, dynamic> json) {
    return Quantity(
      box: json['box'],
      bal: json['bal'],
      lusin: json['lusin'],
      pack: json['pack'],
      pcs: json['pcs'],
    );
  }

  Map<String, dynamic> toJson() => {
    'box': box,
    'bal': bal,
    'lusin': lusin,
    'pack': pack,
    'pcs': pcs,
  };
}
