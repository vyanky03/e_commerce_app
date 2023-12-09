import 'package:hive/hive.dart';

import '../../model/product.dart';

class LocalProductService {
  late Box<Product> _popularProductBox;
  late Box<Product> _productBox;

  Future<void> init() async {
    _popularProductBox = await Hive.openBox<Product>('PopularProducts');
    _productBox = await Hive.openBox<Product>('Products');
  }

  Future<void> assignAllPopularProducts(
      {required List<Product> popularProducts}) async {
    await _popularProductBox.clear();
    await _popularProductBox.addAll(popularProducts);
  }

  Future<void> assignAllProducts({required List<Product> products}) async {
    await _productBox.clear();
    await _productBox.addAll(products);
  }

  List<Product> getPopularProducts() => _popularProductBox.values.toList();
  List<Product> getProducts() => _productBox.values.toList();
}
