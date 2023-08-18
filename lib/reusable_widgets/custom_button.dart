import 'package:flutter/material.dart';
import 'package:flutter_deneme_projem/pages/login_page.dart';

class custom_button extends StatelessWidget {
  final String title;
  final Function()? onTap;

  custom_button({
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.symmetric(horizontal: 60.0),
        decoration: BoxDecoration(
          color: global_theme.colorScheme.inversePrimary,
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: global_theme.colorScheme.secondary,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
