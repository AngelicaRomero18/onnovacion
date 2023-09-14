import 'package:onnovacion/categories/domain/category.dart';

abstract class CategoryRepository {
  Future<List<Category>> get();
}
