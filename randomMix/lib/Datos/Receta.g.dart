// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Receta.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecetaAdapter extends TypeAdapter<Receta> {
  @override
  final int typeId = 0;

  @override
  Receta read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Receta(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as bool,
      fields[4] as bool,
      fields[5] as bool,
      fields[6] as bool,
      fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Receta obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.nombreReceta)
      ..writeByte(1)
      ..write(obj.detalles)
      ..writeByte(2)
      ..write(obj.ingredientes)
      ..writeByte(3)
      ..write(obj.almuerzo)
      ..writeByte(4)
      ..write(obj.cena)
      ..writeByte(5)
      ..write(obj.lacteos)
      ..writeByte(6)
      ..write(obj.vegano)
      ..writeByte(7)
      ..write(obj.favorito);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecetaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
