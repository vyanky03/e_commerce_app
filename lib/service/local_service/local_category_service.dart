import 'package:e_commerce_app/model/category.dart';
import 'package:hive/hive.dart';

class LocalCategoryService {
  late Box<Category> _categoryBox;
  late Box<Category> _popularCategoryBox;

  Future<void> init() async {
    _categoryBox = await Hive.openBox<Category>('Category');
    _popularCategoryBox = await Hive.openBox<Category>('PopularCategory');
  }

  Future<void> assignAllCategory({required List<Category> category}) async {
    await _categoryBox.clear();
    await _categoryBox.addAll(category);
  }

  Future<void> assignAllPopularCategory(
      {required List<Category> popularCategory}) async {
    await _popularCategoryBox.clear();
    await _popularCategoryBox.addAll(popularCategory);
  }

  List<Category> getCategory() => _categoryBox.values.toList();
  List<Category> getPopularCategory() => _popularCategoryBox.values.toList();
}
