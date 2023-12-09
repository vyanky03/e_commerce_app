class Tag {
  final int id;
  final String title;
  final double price;
  Tag({
    required this.id,
    required this.price,
    required this.title,
  });

  factory Tag.fromjson(Map<String, dynamic> data) => Tag(
        id: data['id'],
        title: data['attributes']['title'],
        price: data['attributes']['price'].toDouble(),
      );
}
