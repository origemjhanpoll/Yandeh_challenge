import 'package:flutter/material.dart';

class ChipAtom extends StatelessWidget {
  const ChipAtom({
    super.key,
    required this.label,
    required this.selected,
    this.onSelected,
    this.color,
  });
  final String label;
  final bool selected;
  final Color? color;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : null,
          fontWeight: selected ? FontWeight.bold : null,
        ),
      ),
      selectedColor: color ?? Colors.red,
      visualDensity: VisualDensity.compact,
      selected: selected,
      onSelected: onSelected,
      showCheckmark: false,
    );
  }
}
