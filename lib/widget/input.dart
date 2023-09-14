// ignore_for_file: library_private_types_in_public_api, unnecessary_null_comparison

import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  const Input({
    Key? key,
    this.labelText,
    this.onChange,
    this.validator,
    required this.obligatoryField,
    required this.width,
    this.labelInput,
  }) : super(key: key);

  final dynamic labelText;
  final Function(dynamic)? onChange;
  final Function(String)? validator;
  final String obligatoryField;
  final double width;
  final String? labelInput;

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                  widget.obligatoryField,
                  style: const TextStyle(color: Colors.red, fontSize: 20),
                ),
                const Text('')
              ],
            )
          ],
        ),
        SizedBox(
            width: double.infinity,
            child: TextFormField(
              onChanged: (value) {
                widget.onChange!(value);
              },
              validator: (value) {
                return widget.validator!(value!);
              },
              style: const TextStyle(
                color: Color(0xFF6A6A6A),
                fontSize: 16,
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: widget.labelText,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                      color: Color(0xFF9BA3AF),
                      width: 1,
                    )),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    color: Color(0xFF9BA3AF),
                    width: 1,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 8, vertical: 4), // add padding to adjust text
                isDense: true,
              ),
            )),
      ],
    );
  }
}
