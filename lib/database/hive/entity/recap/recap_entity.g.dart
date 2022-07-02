// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recap_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecapEntityAdapter extends TypeAdapter<RecapEntity> {
  @override
  final int typeId = 4;

  @override
  RecapEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecapEntity(
      listProduct: (fields[0] as List).cast<ProductEntity>(),
      createdAt: fields[5] as DateTime,
      person: fields[1] as AccountEntity,
      note: fields[3] as String?,
      debt: fields[4] as int,
      customer: fields[2] as CustomerEntity,
    );
  }

  @override
  void write(BinaryWriter writer, RecapEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.listProduct)
      ..writeByte(1)
      ..write(obj.person)
      ..writeByte(2)
      ..write(obj.customer)
      ..writeByte(3)
      ..write(obj.note)
      ..writeByte(4)
      ..write(obj.debt)
      ..writeByte(5)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecapEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
