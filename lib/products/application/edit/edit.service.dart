// ignore_for_file: avoid_print

import 'package:onnovacion/products/domain/product.dart';

class ProductEditService {
  ProductEditService();

  Future<void> editProduct(Product product) async {
    print('Product Edited ${product.id}');
  }
}
