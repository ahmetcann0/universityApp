import 'package:flutter/material.dart';
import 'package:flutter_deneme_projem/pages/login_page.dart';

class custom_text extends StatelessWidget {
  custom_text({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(horizontal: 40.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: global_theme.colorScheme.inversePrimary),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          color: global_theme.colorScheme.secondary,
          fontWeight: FontWeight.w800,
          fontSize: 30.0,
        ),
      ),
    );
  }
}
