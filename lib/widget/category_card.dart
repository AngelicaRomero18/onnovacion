import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool active;
  const CategoryCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 107,
      height: 122,
      margin: const EdgeInsets.only(right: 30),
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: active ? const Color(0xFF0793DA) : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        shadows: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 16,
            offset: Offset(4, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: 60,
              height: 60,
              child: Icon(
                icon,
                color: active ? Colors.white : const Color(0xff9BA3AF),
                size: 60,
              )),
          Text(
            title,
            style: TextStyle(
              color: active ? Colors.white : const Color(0xFF262626),
              fontSize: 18,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
