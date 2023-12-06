import 'package:e_commerce_app/model/popular_product.dart';
import 'package:hive/hive.dart';

class LocalPopularProductService {
  late Box<Product> _popularProductBox;

  Future<void> init() async {
    _popularProductBox = await Hive.openBox<Product>('product');
  }

  Future<void> assignAllPopularProduct({required List<Product> product}) async {
    await _popularProductBox.clear();
    await _popularProductBox.addAll(product);
  }

  List<Product> getProduct() => _popularProductBox.values.toList();
}
