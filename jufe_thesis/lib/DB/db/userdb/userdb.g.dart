// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userdb.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapterDB extends TypeAdapter<Userdb> {
  @override
  final int typeId = 0;

  @override
  Userdb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Userdb(
      fields[0] as int?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as String?,
      fields[5] as bool?,
      fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Userdb obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.password)
      ..writeByte(4)
      ..write(obj.studendID)
      ..writeByte(5)
      ..write(obj.login)
      ..writeByte(6)
      ..write(obj.imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapterDB &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
