import 'package:hive/hive.dart';
part 'tags.g.dart';

@HiveType(typeId: 4)
class Tags {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final double price;
  Tags({
    required this.id,
    required this.price,
    required this.title,
  });

  factory Tags.fromjson(Map<String, dynamic> data) => Tags(
        id: data['id'],
        title: data['attributes']['title'],
        price: data['attributes']['price'].toDouble(),
      );
}
