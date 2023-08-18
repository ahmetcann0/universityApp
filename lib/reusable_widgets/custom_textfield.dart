import 'package:flutter/material.dart';

class custom_textfield extends StatelessWidget {
  custom_textfield({
    Key? key,
    required this.text,
    required this.border_color,
    required this.obscureText,
    required this.fillColor,
    required this.text_color,
    required this.controller,
  }) : super(key: key);

  final String text;
  final Color border_color;
  final bool obscureText;
  final Color fillColor;
  final Color text_color;
  final TextEditingController controller;
  // Add this line

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: text,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: border_color,
          ),
        ),
        fillColor: fillColor,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: text_color),
        ),
      ),
      obscureText: obscureText,
      controller: controller,
    );
  }
}
