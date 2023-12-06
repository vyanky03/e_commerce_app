import 'package:hive/hive.dart';
part 'product_grid.g.dart';

@HiveType(typeId: 4)
class ProductGrid {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String image;
  @HiveField(2)
  final String description;

  ProductGrid({
    required this.description,
    required this.id,
    required this.image,
  });
}
