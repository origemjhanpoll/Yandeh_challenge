import 'package:flutter/material.dart';
import 'package:yandeh_challenge/app/shared/styles/sizes.dart';

class AccountLoggedMolecule extends StatelessWidget {
  const AccountLoggedMolecule({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final isScreenMedium = MediaQuery.of(context).size.width > ScreenSize.small;

    return Column(
      children: [
        Text(
          title,
          maxLines: 1,
          textAlign: isScreenMedium ? TextAlign.left : TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.titleLarge!.copyWith(
            color: const Color(0xFF04283B),
            fontSize: isScreenMedium ? 16 : 22,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          subtitle,
          maxLines: 1,
          textAlign: isScreenMedium ? TextAlign.left : TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.bodyLarge!.copyWith(
            color: theme.hintColor,
            fontSize: isScreenMedium ? 12 : 14,
          ),
        ),
      ],
    );
  }
}
