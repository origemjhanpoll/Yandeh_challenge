import 'package:flutter/material.dart';
import 'package:yandeh_challenge/feature/presentation/widgets/styles/sizes.dart';

class SectionHeaderMolecule extends StatelessWidget {
  const SectionHeaderMolecule({
    super.key,
    required this.title,
    required this.description,
    required this.textButtton,
    this.onPressed,
  });
  final String title;
  final String description;
  final String textButtton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final isScreenMedium = MediaQuery.of(context).size.width > ScreenSize.small;

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(58.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: theme.textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            if (isScreenMedium)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: Text(description),
                ),
              ),
            OutlinedButton(onPressed: onPressed, child: Text(textButtton)),
          ],
        ),
      ),
    );
  }
}
