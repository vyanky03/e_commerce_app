import 'package:e_commerce_app/model/category.dart';
import 'package:hive/hive.dart';

class LocalCategoryService {
  late Box<Category> _categoryBox;

  Future<void> init() async {
    _categoryBox = await Hive.openBox<Category>('Category');
  }

  Future<void> assignAllCategory({required List<Category> category}) async {
    await _categoryBox.clear();
    await _categoryBox.addAll(category);
  }

  List<Category> getCategory() => _categoryBox.values.toList();
}
