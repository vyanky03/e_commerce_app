import 'dart:convert';
import 'package:e_commerce_app/model/tags.dart';
import 'package:hive/hive.dart';
part 'popular_product.g.dart';

List<Product> popularProductListfromJson(String val) => List<Product>.from(
    json.decode(val)['data'].map((val) => Product.popularProductfromJson(val)));

List<Product> productListfromJson(String val) => List<Product>.from(
    json.decode(val)['data'].map((val) => Product.productfromJson(val)));

@HiveType(typeId: 3)
class Product {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int id;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final List<Tags> tags;
  @HiveField(4)
  final List<String> images;

  Product({
    required this.id,
    required this.description,
    required this.name,
    required this.tags,
    required this.images,
  });

  factory Product.popularProductfromJson(Map<String, dynamic> data) => Product(
        id: data['id'],
        description: data['attributes']['product']['data']['attributes']
            ['description'],
        name: data['attributes']['product']['data']['attributes']['name'],
        tags: [],
        images: List<String>.from(data['attributes']['product']['data']
                ['attributes']['images']['data']
            .map((image) => image['attributes']['url'])),
      );

  factory Product.productfromJson(Map<String, dynamic> data) => Product(
      id: data['id'],
      name: data['attributes']['name'],
      description: data['attributes']['description'],
      images: List<String>.from(data['attributes']['images']['data']
          .map((image) => image['attributes']['url'])),
      tags: List<Tags>.from(
        data['attributes']['tags']['data'].map((val) => Tags.fromjson(val)),
      ));
}
