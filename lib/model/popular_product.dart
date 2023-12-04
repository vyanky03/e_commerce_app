import 'dart:convert';
import 'package:hive/hive.dart';
part 'popular_product.g.dart';

List<Product> popularProductfromJson(String val) => List<Product>.from(json
    .decode(val)['data']
    .map((product) => Product.popularProductfromJson(product)));

@HiveType(typeId: 3)
class Product {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int id;
  @HiveField(2)
  final String description;
  // final List<String> images;

  Product({
    required this.id,
    required this.description,
    // required this.images,
    required this.name,
  });

  factory Product.popularProductfromJson(Map<String, dynamic> data) => Product(
        id: data['id'],
        description: data['attributes']['product']['data']['attributes']
            ['description'],
        name: data['attributes']['product']['data']['attributes']['name'],
        // images: List<String>.from(data['attributes']['product']['data']
        //         ['attributes']['images']['data']
        //     .map((image) => image['attributes']['url'])),
      );
}
