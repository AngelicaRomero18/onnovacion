// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  int id;
  String code;
  bool state;
  String price;
  String product;
  String description;
  int category;

  Product({
    required this.id,
    required this.code,
    required this.state,
    required this.price,
    required this.product,
    required this.description,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        code: json["codigo"],
        state: json["estado"],
        price: json["precio"],
        product: json["producto"],
        description: json["descripcion"],
        category: json["idCategoria"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "state": state,
        "price": price,
        "product": product,
        "description": description,
        "category": category,
      };
}
