import 'package:hive/hive.dart';
part 'tags.g.dart';

@HiveType(typeId: 5)
class Tag {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
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
