import 'dart:convert';

import 'package:onnovacion/categories/domain/category.dart';
import 'package:onnovacion/categories/domain/category.repository.dart';
import 'package:http/http.dart' as http;

class CategoryApiRepository extends CategoryRepository {
  @override
  Future<List<Category>> get() async {
    var headers = {
      'Content-Type': 'application/json',
    };
    var uri = Uri.parse('http://192.168.0.8:3000/categorias');
    var request = http.Request('GET', uri);
    request.headers.addAll(headers);
    try {
      http.StreamedResponse response = await request.send();
      var streamedResponse = await response.stream.bytesToString();
      var dataDecode = jsonDecode(streamedResponse);

      List<Category> categories = (dataDecode as List<dynamic>)
          .map((categoryJson) => Category.fromJson(categoryJson))
          .toList();
      return categories;
    } catch (err) {
      rethrow;
    }
  }
}
