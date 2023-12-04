import 'dart:convert';

List<Product> popularProductfromJson(String val) => List<Product>.from(json
    .decode(val)['data']
    .map((product) => Product.popularProductfromJson(product)));

class Product {
  final String name;
  final int id;
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
