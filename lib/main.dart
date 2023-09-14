import 'package:flutter/material.dart';
import 'package:onnovacion/views/pages/home.dart';
import 'package:onnovacion/views/auth/login.dart';
import 'package:onnovacion/views/pages/createProduct.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => const Login(),
        'home': (BuildContext context) => const Home(),
        'addProduct': (BuildContext context) => const CreateProduct(),
      },
      theme: ThemeData(
          fontFamily: 'Poppins',
          scaffoldBackgroundColor: const Color.fromARGB(255, 209, 212, 237),
          appBarTheme: const AppBarTheme(color: Colors.white)),
      home: const Home(),
    );
  }
}
