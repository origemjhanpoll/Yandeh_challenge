import 'package:flutter/material.dart';

class ShoppingListAtom extends StatelessWidget {
  const ShoppingListAtom({
    super.key,
    this.icon,
    this.count = 0,
    this.onPressed,
  });

  final Icon? icon;
  final int count;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return FilledButton.icon(
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.red),
      ),
      label: Text(
        count.toString(),
        style: theme.textTheme.titleMedium!
            .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      icon: const Icon(
        Icons.shopping_cart_outlined,
        color: Colors.white,
      ),
      onPressed: onPressed,
    );
  }
}
