// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_grid.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductGridAdapter extends TypeAdapter<ProductGrid> {
  @override
  final int typeId = 4;

  @override
  ProductGrid read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductGrid(
      description: fields[2] as String,
      id: fields[0] as int,
      image: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProductGrid obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductGridAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
