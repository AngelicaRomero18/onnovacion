import 'package:onnovacion/products/domain/product.dart';

class ProductDeleteService {
  ProductDeleteService();

  Future<List<Product>> deleteProduct(
      List<Product> products, Product product) async {
    List<Product> newProducts =
        products.where((element) => element != product).toList();
    return newProducts;
  }
}
