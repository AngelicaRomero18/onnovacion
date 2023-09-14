// ignore_for_file: unnecessary_null_comparison

import 'package:onnovacion/categories/domain/category.dart';
import 'package:onnovacion/categories/domain/category.repository.dart';

class CategoryService {
  final CategoryRepository repository;
  CategoryService({required this.repository});

  Future<List<Category>> execute() async {
    List<Category> category = await repository.get();
    if (category == null) {
      return [];
    }

    return category;
  }
}
