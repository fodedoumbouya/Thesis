// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userdb.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<Name> {
  @override
  final int typeId = 0;

  @override
  Name read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Name()
      ..id = fields[0] as int?
      ..name = fields[1] as String?
      ..email = fields[2] as String?
      ..password = fields[3] as String?
      ..studendID = fields[4] as String?
      ..login = fields[5] as bool?
      ..imageUrl = fields[6] as String?;
  }

  @override
  void write(BinaryWriter writer, Name obj) {
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
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
