import 'package:onnovacion/products/domain/product.dart';

abstract class ProductRepository {
  Future<List<Product>> get(int categoryId);
}
