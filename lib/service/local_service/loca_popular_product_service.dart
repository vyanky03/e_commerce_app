import 'package:e_commerce_app/model/popular_product.dart';
import 'package:hive/hive.dart';

class LocalPopularProductService {
  late Box<Product> _popularProductBox;
  late Box<Product> _productBox;

  Future<void> init() async {
    _popularProductBox = await Hive.openBox<Product>('product');
    _productBox = await Hive.openBox<Product>('popularproduct');
  }

  Future<void> assignAllPopularProduct({required List<Product> product}) async {
    await _popularProductBox.clear();
    await _popularProductBox.addAll(product);
  }

  Future<void> assignAllProduct({required List<Product> poularproduct}) async {
    await _productBox.clear();
    await _productBox.addAll(poularproduct);
  }

  List<Product> getProduct() => _popularProductBox.values.toList();
  List<Product> getPopularProduct() => _productBox.values.toList();
}
