import 'dart:convert';

List<Category> popularCategoryFromJson(String val) => List<Category>.from(json
    .decode(val)['data']
    .map((category) => Category.popularCategoryFromJson(category)));

class Category {
  final String name, image;
  // final String image;
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
