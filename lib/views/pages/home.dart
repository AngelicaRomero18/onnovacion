// ignore_for_file: library_private_types_in_public_api, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:onnovacion/categories/application/get.service.dart';
import 'package:onnovacion/categories/domain/category.dart';
import 'package:onnovacion/categories/insfrastructure/get.api.dart';
import 'package:onnovacion/products/application/delete/delete.service.dart';
import 'package:onnovacion/products/application/get.service.dart';
import 'package:onnovacion/products/domain/product.dart';
import 'package:onnovacion/products/insfrastructure/get.api.dart';
import 'package:onnovacion/shared/common/icons_onnovacion_icons.dart';
import 'package:onnovacion/views/pages/createProduct.dart';
import 'package:onnovacion/views/pages/layout.dart';
import 'package:onnovacion/widget/category_card.dart';
import 'package:onnovacion/widget/product_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ProductService productService = ProductService(
    repository: ProductApiRepository(),
  );
  ProductDeleteService productDeleteService = ProductDeleteService();
  CategoryService categoryService = CategoryService(
    repository: CategoryApiRepository(),
  );
  late List<Product> listProducts = [];
  late List<Category> listCategories = [];
  late Category categorySelected;

  @override
  void initState() {
    getCategories();
    super.initState();
  }

  void getCategories() async {
    List<Category>? categories = await categoryService.execute();
    if (categories == null) return;

    setState(() {
      listCategories = categories;
      categorySelected = categories.first;
    });
    getProducts();
  }

  void getProducts() async {
    if (categorySelected == null) return;
    List<Product>? products = await productService.execute(categorySelected.id);

    if (products == null) return;
    setState(() {
      listProducts = products;
    });
  }

  bool categoryActive(Category category) {
    if (categorySelected.id != category.id) return false;

    return true;
  }

  editItem(Product item) {
    return Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => CreateProduct(
                edit: true,
                editItem: item,
              )),
    );
  }

  void removeItem(Product item) async {
    List<Product>? products =
        await productDeleteService.deleteProduct(listProducts, item);
    setState(() {
      listProducts = products;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Categorias',
              style: TextStyle(
                color: Color(0xFF262626),
                fontSize: 24,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            SizedBox(
                height: 150,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: listCategories
                          .map((e) => InkWell(
                                onTap: () {
                                  setState(() {
                                    categorySelected = e;
                                    getProducts();
                                  });
                                },
                                child: CategoryCard(
                                    title: e.name,
                                    icon: e.name == 'Muebles'
                                        ? IconsOnnovacion.furniture
                                        : e.name == 'Pinturas'
                                            ? IconsOnnovacion.paint
                                            : IconsOnnovacion.toys,
                                    active: categoryActive(e)),
                              ))
                          .toList(),
                    ))),
            const SizedBox(height: 16),
            const Text(
              'Productos',
              style: TextStyle(
                color: Color(0xFF262626),
                fontSize: 24,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
                child: SingleChildScrollView(
                    child: Column(
                        children: listProducts
                            .map((e) => ProductCard(
                                  id: e.id.toString(),
                                  name: e.product,
                                  description: e.description,
                                  price: e.price,
                                  onTapEdit: () => editItem(e),
                                  onTapDelete: () => removeItem(e),
                                ))
                            .toList())))
          ],
        ),
      ),
    );
  }
}
