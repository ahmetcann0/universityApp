import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            letterSpacing: 4.0,
            fontWeight: FontWeight.w600)),
    colorScheme: ColorScheme.light(
      background: Color.fromARGB(255, 195, 219, 195),
      primary: Colors.grey[800]!,
      secondary: Colors.white,
      inversePrimary: Colors.grey[900],
    ));
