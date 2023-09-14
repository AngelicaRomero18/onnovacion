import 'dart:convert';

import 'package:onnovacion/products/domain/product.dart';
import 'package:onnovacion/products/domain/product.repository.dart';
import 'package:http/http.dart' as http;

class ProductApiRepository extends ProductRepository {
  @override
  Future<List<Product>> get(int categoryId) async {
    var headers = {
      'Content-Type': 'application/json',
    };
    var uri = Uri.parse('http://192.168.0.8:3000/productos');

    var request = http.Request('GET', uri);
    request.headers.addAll(headers);
    try {
      http.StreamedResponse response = await request.send();
      var streamedResponse = await response.stream.bytesToString();
      var dataDecode = jsonDecode(streamedResponse);

      List<Product> products = (dataDecode as List<dynamic>)
          .map((productJson) => Product.fromJson(productJson))
          .toList();
      List<Product> productsFound =
          products.where((product) => product.category == categoryId).toList();
      return productsFound;
    } catch (err) {
      rethrow;
    }
  }
}
