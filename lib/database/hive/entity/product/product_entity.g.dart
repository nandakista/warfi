// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductEntityAdapter extends TypeAdapter<ProductEntity> {
  @override
  final int typeId = 0;

  @override
  ProductEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductEntity(
      id: fields[0] as String,
      name: fields[1] as String?,
      price: fields[2] as int?,
      createdAt: fields[7] as DateTime?,
      updateAt: fields[8] as DateTime?,
      dus: fields[3] as int?,
      bal: fields[4] as int?,
      pack: fields[5] as int?,
      pcs: fields[6] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductEntity obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.dus)
      ..writeByte(4)
      ..write(obj.bal)
      ..writeByte(5)
      ..write(obj.pack)
      ..writeByte(6)
      ..write(obj.pcs)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.updateAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
