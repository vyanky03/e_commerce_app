import 'package:e_commerce_app/model/popular_product.dart';
import 'package:hive/hive.dart';

class LocalPopularProductService {
  late Box<Product> _productBox;

  Future<void> init() async {
    _productBox = await Hive.openBox<Product>('product');
  }

  Future<void> assignAllPopularProduct({required List<Product> product}) async {
    await _productBox.clear();
    await _productBox.addAll(product);
  }

  List<Product> getProduct() => _productBox.values.toList();
}
