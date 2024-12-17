import 'package:flutter/material.dart';
import 'package:yandeh_challenge/app/shared/styles/sizes.dart';

class HeaderMolecule extends StatelessWidget {
  const HeaderMolecule({
    super.key,
    required this.title,
    this.description,
    required this.textButtton,
    this.onPressed,
  });
  final String title;
  final String? description;
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
          children: [
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: theme.textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            if (description != null &&
                description!.isNotEmpty &&
                isScreenMedium)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: Text(
                    description!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: OutlinedButton(
                    onPressed: onPressed,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textButtton,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
