import 'package:flutter/material.dart';

class CustomToggleButton extends StatelessWidget {
  final List<bool> isSelected;
  final void Function(int) onPressed;

  final List<Widget> children;

  CustomToggleButton({
    Key? key,
    required this.isSelected,
    required this.onPressed,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: isSelected,
      onPressed: onPressed,
      children: children,
    );
  }
}
