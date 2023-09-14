// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:onnovacion/widget/bottom_nav.dart';

class Layout extends StatelessWidget {
  final Widget? child;
  const Layout({Key? key, this.child}) : super(key: key);

  String getCurrentPath(BuildContext context) {
    final RouteSettings? settings = ModalRoute.of(context)?.settings;
    if (settings == null || settings.name == null) {
      return 'home';
    }
    final String currentPath = settings.name!;
    return currentPath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 86,
            backgroundColor: const Color(0xFF0793DA),
            title: const Image(
              image: AssetImage('assets/group.png'),
              height: 200,
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(16),
              ),
            )),
        body: child,
        bottomNavigationBar: BottomNav(
          tabSelected: getCurrentPath(context),
        ));
  }
}
