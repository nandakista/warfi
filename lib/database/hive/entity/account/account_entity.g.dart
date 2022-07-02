// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountEntityAdapter extends TypeAdapter<AccountEntity> {
  @override
  final int typeId = 3;

  @override
  AccountEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccountEntity(
      name: fields[0] as String?,
      phone: fields[1] as String?,
      email: fields[2] as String?,
      address: fields[3] as String?,
      role: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AccountEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.phone)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.address)
      ..writeByte(4)
      ..write(obj.role);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
