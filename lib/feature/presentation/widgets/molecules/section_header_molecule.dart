import 'package:flutter/material.dart';

class SectionHeaderMolecule extends StatelessWidget {
  const SectionHeaderMolecule({
    super.key,
    required this.title,
    required this.description,
    this.textButtton,
    this.onPressed,
  });
  final String title;
  final String description;
  final String? textButtton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;

    final screenMedium = screenWidth > 600;

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(58.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: theme.textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            if (screenMedium)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: Text(description),
                ),
              ),
            OutlinedButton(
                style: const ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(Size(104, 32)),
                ),
                onPressed: onPressed,
                child: textButtton != null ? Text(textButtton!) : null),
          ],
        ),
      ),
    );
  }
}
