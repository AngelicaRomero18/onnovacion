// ignore_for_file: avoid_print

import 'package:onnovacion/products/domain/product.dart';

class ProductCreateService {
  ProductCreateService();

  Future<void> createProduct(Product product) async {
    print('Product Edited ${product.id}');
  }
}
