class Tags {
  final int id;
  final String title;
  final double price;
  Tags({
    required this.id,
    required this.price,
    required this.title,
  });

  factory Tags.fromjson(Map<String, dynamic> data) => Tags(
      id: data['id'],
      price: data['attributes']['price'].toDouble,
      title: data['attributes']['title']);
}
