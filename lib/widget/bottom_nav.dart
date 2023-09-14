// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:onnovacion/shared/common/icons_onnovacion_icons.dart';

class BottomNav extends StatefulWidget {
  final String tabSelected;
  const BottomNav({Key? key, required this.tabSelected}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 8,
        left: 32,
        right: 32,
        bottom: 16,
      ),
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
              onTap: () => Navigator.pushNamed(context, "addProduct"),
              child: Container(
                  padding: const EdgeInsets.all(4),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: widget.tabSelected == 'addProduct'
                        ? const Color(0xFF0793DA)
                        : Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  child: Icon(
                    IconsOnnovacion.createproduct,
                    color: widget.tabSelected == 'addProduct'
                        ? Colors.white
                        : const Color(0xFF9BA3AF),
                    size: 40,
                  ))),
          const SizedBox(width: 16),
          InkWell(
              onTap: () => Navigator.pushNamed(context, "home"),
              child: Container(
                  padding: const EdgeInsets.all(4),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: widget.tabSelected == 'home'
                        ? const Color(0xFF0793DA)
                        : Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  child: Icon(
                    IconsOnnovacion.home,
                    color: widget.tabSelected == 'home'
                        ? Colors.white
                        : const Color(0xFF9BA3AF),
                    size: 40,
                  ))),
          const SizedBox(width: 16),
          InkWell(
              onTap: () => Navigator.pushNamed(context, "login"),
              child: Container(
                  padding: const EdgeInsets.all(4),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  child: const Icon(
                    Icons.logout_outlined,
                    color: Color(0xFF9BA3AF),
                    size: 40,
                  ))),
        ],
      ),
    );
  }
}
