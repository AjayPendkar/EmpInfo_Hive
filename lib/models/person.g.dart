// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersonAdapter extends TypeAdapter<Person> {
  @override
  final int typeId = 1;

  @override
  Person read(BinaryReader reader) {

    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),

      
    };
    return Person(
      name: fields[0] as String,
      country: fields[1] as String,
      role:fields[2] as String,
       passWord:fields[3] as String,
        gender:fields[4] as String,
         emailAddress:fields[5] as String,
          mobileNumber:fields[6] as String,
           panCard:fields[7] as String,
            designation:fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Person obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.country)
            ..writeByte(2)
      ..write(obj.role)
            ..writeByte(3)
      ..write(obj.passWord)
            ..writeByte(4)
      ..write(obj.gender)
            ..writeByte(5)
      ..write(obj.emailAddress)
            ..writeByte(6)
      ..write(obj.mobileNumber)
            ..writeByte(7)
      ..write(obj.panCard)
            ..writeByte(8)
      ..write(obj.designation);
      
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
