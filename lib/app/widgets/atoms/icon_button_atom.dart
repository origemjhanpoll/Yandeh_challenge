import 'package:flutter/material.dart';

class IconButtonAtom extends IconButton {
  IconButtonAtom({
    super.key,
    required super.onPressed,
    super.icon = const Icon(Icons.add),
    Color backgroundColor = Colors.red,
    Color color = Colors.white,
  }) : super(
          color: color,
          style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(backgroundColor)),
        );
}
