// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionEntityAdapter extends TypeAdapter<TransactionEntity> {
  @override
  final int typeId = 1;

  @override
  TransactionEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionEntity(
      name: fields[0] as String?,
      price: fields[1] as int?,
      createdAt: fields[6] as DateTime?,
      updateAt: fields[7] as DateTime?,
      dus: fields[2] as int?,
      bal: fields[3] as int?,
      pack: fields[4] as int?,
      pcs: fields[5] as int?,
      note: fields[8] as String?,
      account: fields[9] as String?,
      debt: fields[10] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, TransactionEntity obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.dus)
      ..writeByte(3)
      ..write(obj.bal)
      ..writeByte(4)
      ..write(obj.pack)
      ..writeByte(5)
      ..write(obj.pcs)
      ..writeByte(6)
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.updateAt)
      ..writeByte(8)
      ..write(obj.note)
      ..writeByte(9)
      ..write(obj.account)
      ..writeByte(10)
      ..write(obj.debt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
