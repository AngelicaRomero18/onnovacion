// ignore_for_file: depend_on_referenced_packages

import 'package:onnovacion/products/application/delete/delete.service.dart';
import 'package:onnovacion/products/domain/product.dart';
import 'package:test/test.dart';

List<Product> productsMock = [
  Product(
      id: 1,
      code: 'cf572189-3b9b-4f24-938a-9e8c70d4fcd5',
      state: true,
      price: '120000',
      product: 'producto 1',
      description: 'description',
      category: 1),
  Product(
      id: 2,
      code: 'e79e12d2-145a-448d-8c7b-ccfd686bb02e',
      state: true,
      price: '120000',
      product: 'producto 2',
      description: 'description',
      category: 1)
];

void main() {
  test('Should deleted', () async {
    final deleteService = ProductDeleteService();
    Product productToDelete = productsMock[1];

    List<Product> newProducts =
        await deleteService.deleteProduct(productsMock, productToDelete);

    expect(newProducts.contains(productToDelete), false);
  });
}
