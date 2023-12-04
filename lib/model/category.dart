import 'dart:convert';
import 'package:hive/hive.dart';
part 'category.g.dart';

List<Category> popularCategoryFromJson(String val) => List<Category>.from(json
    .decode(val)['data']
    .map((category) => Category.popularCategoryFromJson(category)));

@HiveType(typeId: 2)
class Category {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String image;
  @HiveField(2)
  final int id;

  Category({
    required this.name,
    required this.id,
    required this.image,
  });

  factory Category.popularCategoryFromJson(Map<String, dynamic> data) =>
      Category(
        name: data['attributes']['category']['data']['attributes']['name'],
        id: data['id'],
        image: data['attributes']['category']['data']['attributes']['image']
            ['data']['attributes']['url'],
      );
}
