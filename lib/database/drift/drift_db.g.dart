// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ProductEntityData extends DataClass
    implements Insertable<ProductEntityData> {
  final int id;
  final String name;
  final String price;
  final int box;
  final int bal;
  final int pack;
  final int pcs;
  ProductEntityData(
      {required this.id,
      required this.name,
      required this.price,
      required this.box,
      required this.bal,
      required this.pack,
      required this.pcs});
  factory ProductEntityData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ProductEntityData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      price: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}price'])!,
      box: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}box'])!,
      bal: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bal'])!,
      pack: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}pack'])!,
      pcs: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}pcs'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['price'] = Variable<String>(price);
    map['box'] = Variable<int>(box);
    map['bal'] = Variable<int>(bal);
    map['pack'] = Variable<int>(pack);
    map['pcs'] = Variable<int>(pcs);
    return map;
  }

  ProductEntityCompanion toCompanion(bool nullToAbsent) {
    return ProductEntityCompanion(
      id: Value(id),
      name: Value(name),
      price: Value(price),
      box: Value(box),
      bal: Value(bal),
      pack: Value(pack),
      pcs: Value(pcs),
    );
  }

  factory ProductEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductEntityData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      price: serializer.fromJson<String>(json['price']),
      box: serializer.fromJson<int>(json['box']),
      bal: serializer.fromJson<int>(json['bal']),
      pack: serializer.fromJson<int>(json['pack']),
      pcs: serializer.fromJson<int>(json['pcs']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'price': serializer.toJson<String>(price),
      'box': serializer.toJson<int>(box),
      'bal': serializer.toJson<int>(bal),
      'pack': serializer.toJson<int>(pack),
      'pcs': serializer.toJson<int>(pcs),
    };
  }

  ProductEntityData copyWith(
          {int? id,
          String? name,
          String? price,
          int? box,
          int? bal,
          int? pack,
          int? pcs}) =>
      ProductEntityData(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        box: box ?? this.box,
        bal: bal ?? this.bal,
        pack: pack ?? this.pack,
        pcs: pcs ?? this.pcs,
      );
  @override
  String toString() {
    return (StringBuffer('ProductEntityData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('box: $box, ')
          ..write('bal: $bal, ')
          ..write('pack: $pack, ')
          ..write('pcs: $pcs')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, price, box, bal, pack, pcs);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductEntityData &&
          other.id == this.id &&
          other.name == this.name &&
          other.price == this.price &&
          other.box == this.box &&
          other.bal == this.bal &&
          other.pack == this.pack &&
          other.pcs == this.pcs);
}

class ProductEntityCompanion extends UpdateCompanion<ProductEntityData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> price;
  final Value<int> box;
  final Value<int> bal;
  final Value<int> pack;
  final Value<int> pcs;
  const ProductEntityCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.price = const Value.absent(),
    this.box = const Value.absent(),
    this.bal = const Value.absent(),
    this.pack = const Value.absent(),
    this.pcs = const Value.absent(),
  });
  ProductEntityCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String price,
    required int box,
    required int bal,
    required int pack,
    required int pcs,
  })  : name = Value(name),
        price = Value(price),
        box = Value(box),
        bal = Value(bal),
        pack = Value(pack),
        pcs = Value(pcs);
  static Insertable<ProductEntityData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? price,
    Expression<int>? box,
    Expression<int>? bal,
    Expression<int>? pack,
    Expression<int>? pcs,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (box != null) 'box': box,
      if (bal != null) 'bal': bal,
      if (pack != null) 'pack': pack,
      if (pcs != null) 'pcs': pcs,
    });
  }

  ProductEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? price,
      Value<int>? box,
      Value<int>? bal,
      Value<int>? pack,
      Value<int>? pcs}) {
    return ProductEntityCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      box: box ?? this.box,
      bal: bal ?? this.bal,
      pack: pack ?? this.pack,
      pcs: pcs ?? this.pcs,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (price.present) {
      map['price'] = Variable<String>(price.value);
    }
    if (box.present) {
      map['box'] = Variable<int>(box.value);
    }
    if (bal.present) {
      map['bal'] = Variable<int>(bal.value);
    }
    if (pack.present) {
      map['pack'] = Variable<int>(pack.value);
    }
    if (pcs.present) {
      map['pcs'] = Variable<int>(pcs.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductEntityCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('box: $box, ')
          ..write('bal: $bal, ')
          ..write('pack: $pack, ')
          ..write('pcs: $pcs')
          ..write(')'))
        .toString();
  }
}

class $ProductEntityTable extends ProductEntity
    with TableInfo<$ProductEntityTable, ProductEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductEntityTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<String?> price = GeneratedColumn<String?>(
      'price', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _boxMeta = const VerificationMeta('box');
  @override
  late final GeneratedColumn<int?> box = GeneratedColumn<int?>(
      'box', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _balMeta = const VerificationMeta('bal');
  @override
  late final GeneratedColumn<int?> bal = GeneratedColumn<int?>(
      'bal', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _packMeta = const VerificationMeta('pack');
  @override
  late final GeneratedColumn<int?> pack = GeneratedColumn<int?>(
      'pack', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _pcsMeta = const VerificationMeta('pcs');
  @override
  late final GeneratedColumn<int?> pcs = GeneratedColumn<int?>(
      'pcs', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, price, box, bal, pack, pcs];
  @override
  String get aliasedName => _alias ?? 'product_entity';
  @override
  String get actualTableName => 'product_entity';
  @override
  VerificationContext validateIntegrity(Insertable<ProductEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('box')) {
      context.handle(
          _boxMeta, box.isAcceptableOrUnknown(data['box']!, _boxMeta));
    } else if (isInserting) {
      context.missing(_boxMeta);
    }
    if (data.containsKey('bal')) {
      context.handle(
          _balMeta, bal.isAcceptableOrUnknown(data['bal']!, _balMeta));
    } else if (isInserting) {
      context.missing(_balMeta);
    }
    if (data.containsKey('pack')) {
      context.handle(
          _packMeta, pack.isAcceptableOrUnknown(data['pack']!, _packMeta));
    } else if (isInserting) {
      context.missing(_packMeta);
    }
    if (data.containsKey('pcs')) {
      context.handle(
          _pcsMeta, pcs.isAcceptableOrUnknown(data['pcs']!, _pcsMeta));
    } else if (isInserting) {
      context.missing(_pcsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ProductEntityData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ProductEntityTable createAlias(String alias) {
    return $ProductEntityTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ProductEntityTable productEntity = $ProductEntityTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [productEntity];
}
