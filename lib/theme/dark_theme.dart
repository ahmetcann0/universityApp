import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          letterSpacing: 4.0,
          fontWeight: FontWeight.w600,
        )),
    colorScheme: ColorScheme.dark(
      background: Colors.grey[900]!,
      primary: Colors.grey[400]!,
      secondary: Colors.black,
      inversePrimary: Color.fromARGB(255, 195, 219, 195),
    ));
