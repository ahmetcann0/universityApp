import 'package:flutter/material.dart';
import 'package:flutter_deneme_projem/pages/login_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color color;

  const CustomAppBar({required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: AppBar(
      title: Text(
        title,
        style: TextStyle(color: global_theme.colorScheme.secondary),
      ),
      centerTitle: true,
      backgroundColor: global_theme.colorScheme.inversePrimary,
      iconTheme: IconThemeData(color: global_theme.colorScheme.secondary),
    ));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
