import 'package:flutter/material.dart';
import 'package:flutter_deneme_projem/pages/login_page.dart';

class custom_listview_text extends StatefulWidget {
  final String text;
  final VoidCallback? call_ders;

  custom_listview_text({required this.text, this.call_ders});

  @override
  _custom_listview_textState createState() => _custom_listview_textState();
}

class _custom_listview_textState extends State<custom_listview_text> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
        child: GestureDetector(
          onTap: widget.call_ders,
          child: Container(
            padding: EdgeInsets.all(10),
            child: ListTile(
              title: Center(
                child: Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2.0,
                    color: isHovered
                        ? global_theme.colorScheme.inversePrimary
                        : global_theme.colorScheme.inversePrimary,
                  ),
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: isHovered
                  ? global_theme.colorScheme.secondary
                  : global_theme.colorScheme.secondary,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
