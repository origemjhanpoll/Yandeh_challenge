import 'package:flutter/material.dart';

class LabelAtom extends StatelessWidget {
  const LabelAtom({
    super.key,
    required this.text,
    this.color,
  });

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return DecoratedBox(
      decoration: const BoxDecoration(
          color: Color(0xFFE5F6FF),
          borderRadius: BorderRadius.all(Radius.circular(6.0))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
        child: Text(
          text,
          style: theme.textTheme.bodySmall!.copyWith(
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1D1B20),
          ),
        ),
      ),
    );
  }
}
