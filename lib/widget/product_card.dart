import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:onnovacion/shared/common/icons_onnovacion_icons.dart';

class ProductCard extends StatelessWidget {
  final String id;
  final String name;
  final String description;
  final String price;
  final Function onTapEdit;
  final Function onTapDelete;

  const ProductCard({
    Key? key,
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.onTapEdit,
    required this.onTapDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 20),
        color: Colors.white,
        child: SwipeActionCell(
            backgroundColor: Colors.white,
            key: ObjectKey(id),
            trailingActions: <SwipeAction>[
              SwipeAction(
                  title: "Editar",
                  onTap: (CompletionHandler handler) async {
                    onTapEdit();
                  },
                  color: Colors.greenAccent),
            ],
            leadingActions: [
              SwipeAction(
                  title: "Eliminar",
                  onTap: (CompletionHandler handler) async {
                    onTapDelete();
                  },
                  color: Colors.red),
            ],
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color(0xff9BA3AF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        IconsOnnovacion.product,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff262626),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '\$ $price',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff6A6A6A),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          description,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff262626),
                          ),
                        ),
                      ],
                    ),
                  ],
                ))));
  }
}
