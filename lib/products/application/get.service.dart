// ignore_for_file: unnecessary_null_comparison

import 'package:onnovacion/products/domain/product.dart';
import 'package:onnovacion/products/domain/product.repository.dart';

class ProductService {
  final ProductRepository repository;
  ProductService({required this.repository});

  Future<List<Product>> execute(int categoryId) async {
    List<Product> product = await repository.get(categoryId);
    if (product == null) {
      return [];
    }

    return product;
  }
}
