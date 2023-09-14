// ignore_for_file: library_private_types_in_public_api, file_names, unnecessary_null_comparison, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:onnovacion/categories/application/get.service.dart';
import 'package:onnovacion/categories/domain/category.dart';
import 'package:onnovacion/categories/insfrastructure/get.api.dart';
import 'package:onnovacion/products/application/create/create.service.dart';
import 'package:onnovacion/products/application/edit/edit.service.dart';
import 'package:onnovacion/products/domain/product.dart';
import 'package:onnovacion/views/pages/layout.dart';
import 'package:onnovacion/widget/button.dart';
import 'package:onnovacion/widget/dropdownButton.dart';
import 'package:onnovacion/widget/input.dart';

class CreateProduct extends StatefulWidget {
  final Product? editItem;
  final bool? edit;
  const CreateProduct({Key? key, this.edit, this.editItem}) : super(key: key);

  @override
  _CreateProductState createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  CategoryService categoryService = CategoryService(
    repository: CategoryApiRepository(),
  );
  ProductEditService productEditService = ProductEditService();
  ProductCreateService productCreateService = ProductCreateService();
  late List<Option> listCategories = [];
  late String categorySelected = '';
  List<Option> state = [
    Option('Seleccione el estado', 'Seleccione el estado'),
    Option('Active', 'Activo'),
    Option('Inactive', 'Inactivo'),
  ];
  late String stateSelected;
  late bool edit = false;
  late Product newProduct;

  @override
  void initState() {
    edit = widget.edit != true ? false : true;
    stateSelected = state.first.value;
    newProduct = widget.editItem ??
        Product(
            id: 1,
            code: '',
            state: true,
            price: '0',
            product: '',
            description: '',
            category: 1);
    super.initState();
    getCategories();
  }

  void getCategories() async {
    List<Category> categories = await categoryService.execute();
    if (categories == null) return;
    Category defaultCategory = categories.first;
    setState(() {
      listCategories = convertList(
          categories.map((category) => category.toJson()).toList(),
          'id',
          'name');
      categorySelected = defaultCategory.id.toString();
    });
  }

  String validState(Product product) {
    if (product.state) {
      return 'Active';
    }
    return 'Inactive';
  }

  List<Option> convertList(
      List<dynamic> list, String targetValue, String targetLabel) {
    List<Option> newList = list
        .map((e) => Option(
              e[targetValue].toString(),
              e[targetLabel],
            ))
        .toList();
    return newList;
  }

  void save() async {
    if (widget.edit == true) {
      await productEditService.editProduct(newProduct);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Producto Editado"),
      ));
    } else {
      await productCreateService.createProduct(newProduct);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Producto Creado"),
      ));
    }
    Navigator.pushNamed(context, "home");
  }

  bool validProductToSave() {
    if (newProduct.product == '' || newProduct.price == '') {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.edit == true ? 'Editar producto' : 'Crear producto',
                style: const TextStyle(
                  color: Color(0xFF262626),
                  fontSize: 24,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              const SizedBox(height: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Input(
                    obligatoryField: widget.edit == true ? '' : '*',
                    width: double.infinity,
                    labelInput: 'Producto',
                    labelText: widget.edit == true
                        ? newProduct.product
                        : 'Nombre del producto',
                    onChange: (value) => newProduct.product = value,
                  ),
                  const SizedBox(height: 15),
                  Dropdown(
                      labelInput: 'Estado',
                      value: widget.edit == true
                          ? validState(newProduct)
                          : stateSelected,
                      onChange: (String? value) {
                        setState(() {
                          stateSelected = value!;
                        });

                        newProduct.state =
                            stateSelected == 'Active' ? true : false;
                      },
                      options: state,
                      width: double.infinity),
                  const SizedBox(height: 15),
                  Input(
                    obligatoryField: widget.edit == true ? '' : '*',
                    width: double.infinity,
                    labelInput: 'Precio',
                    labelText: widget.edit == true
                        ? '\$ ${newProduct.price.toString()}'
                        : '\$ 000.000',
                    onChange: (value) => newProduct.price = value,
                  ),
                  const SizedBox(height: 15),
                  Dropdown(
                      obligatoryField: widget.edit == true ? '' : '*',
                      labelInput: 'Categoria',
                      value: widget.edit == true
                          ? newProduct.category.toString()
                          : categorySelected,
                      onChange: (String? value) {
                        setState(() {
                          categorySelected = value!;
                        });
                        newProduct.category = int.parse(categorySelected);
                      },
                      options: listCategories,
                      width: double.infinity),
                  const SizedBox(height: 15),
                  Input(
                    obligatoryField: '',
                    width: double.infinity,
                    labelInput: 'Descripción',
                    labelText: widget.edit == true
                        ? newProduct.description
                        : 'Describe el producto...',
                    onChange: (value) => newProduct.description = value,
                  )
                ],
              ),
              const SizedBox(height: 50),
              Container(
                alignment: Alignment.centerRight,
                child: Button(
                    width: 75,
                    labelText: widget.edit == true ? 'Editar' : 'Crear',
                    disable: !validProductToSave(),
                    onTap: () => save()),
              )
            ],
          ))),
    );
  }
}
