import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String labelText;
  final double width;
  final Function onTap;
  final bool disable;
  const Button(
      {Key? key,
      required this.labelText,
      required this.width,
      required this.onTap,
      this.disable = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if (disable) return;
          onTap();
        },
        child: SizedBox(
          width: width,
          height: 65,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 40,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: disable ? Colors.grey : const Color(0xFF0794DB),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x260794DB),
                      blurRadius: 10,
                      offset: Offset(4, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      labelText,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
