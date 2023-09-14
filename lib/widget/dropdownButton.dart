// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Option {
  late String value;
  late String label;

  Option(this.value, this.label);

  Map<String, dynamic> toJson() => {"value": value, "label": label};
}

class Dropdown extends StatefulWidget {
  final Function(String) onChange;
  final String value;
  final double width;
  final List<Option> options;
  final String? obligatoryField;
  final String? labelInput;
  final CrossAxisAlignment? crossAxisAlignment;

  const Dropdown({
    super.key,
    required this.value,
    required this.onChange,
    required this.options,
    required this.width,
    this.obligatoryField,
    this.labelInput,
    this.crossAxisAlignment,
  });

  @override
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  bool isValidValue() {
    Option? exist = widget.options
        .firstWhereOrNull((element) => element.value == widget.value);
    if (exist == null) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return widget.value != '' && isValidValue()
        ? Column(
            crossAxisAlignment:
                widget.crossAxisAlignment ?? CrossAxisAlignment.start,
            children: [
                Row(
                  children: [
                    Text(
                      widget.labelInput ?? '',
                      style: const TextStyle(
                        color: Color(0xFF262626),
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0.08,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          widget.obligatoryField ?? '',
                          style:
                              const TextStyle(color: Colors.red, fontSize: 20),
                        ),
                        const Text('')
                      ],
                    )
                  ],
                ),
                Container(
                    alignment: Alignment.center,
                    width: widget.width,
                    height: 28,
                    padding: const EdgeInsets.only(left: 10, right: 7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: const Color(0xFF9BA3AF),
                          width: 1,
                        )),
                    child: DropdownButton<String>(
                        borderRadius: BorderRadius.circular(4),
                        alignment: Alignment.center,
                        value: widget.value,
                        isDense: true,
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          size: 20,
                          color: Color(0xFF9BA3AF),
                        ),
                        style: const TextStyle(
                          color: Color(0xFF6A6A6A),
                          fontSize: 16,
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.w300,
                        ),
                        underline: Container(
                            decoration: const BoxDecoration(
                                border: Border(bottom: BorderSide.none))),
                        onChanged: (String? value) {
                          if (value != null) {
                            widget.onChange(value);
                          }
                        },
                        isExpanded: true,
                        items: widget.options
                            .map((e) => DropdownMenuItem(
                                  value: e.value,
                                  child: Text(e.label),
                                ))
                            .toList())),
              ])
        : Container();
  }
}
