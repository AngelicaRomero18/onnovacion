import 'package:flutter/material.dart';
import 'package:onnovacion/views/auth/login.dart';
import 'package:onnovacion/views/pages/createProduct.dart';
import 'package:onnovacion/views/pages/home.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case 'login':
      return MaterialPageRoute(builder: (_) => const Login());
    case 'home':
      return MaterialPageRoute(builder: (_) => const Home());
    case 'addProduct':
      return MaterialPageRoute(builder: (_) => const CreateProduct());

    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}
