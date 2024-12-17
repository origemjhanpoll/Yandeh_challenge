import 'package:flutter/material.dart';
import 'package:yandeh_challenge/app/shared/atoms/icon_button_atom.dart';
import 'package:yandeh_challenge/app/shared/atoms/image_network_atom.dart';
import 'package:yandeh_challenge/app/shared/atoms/label_atom.dart';
import 'package:yandeh_challenge/app/shared/styles/sizes.dart';

class ProductCardMolecule extends StatelessWidget {
  const ProductCardMolecule({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.label,
    required this.caption,
    required this.footerText,
    this.onPressed,
    required this.isAdded,
  });
  final String? image;
  final String title;
  final String subtitle;
  final String label;
  final String caption;
  final String footerText;
  final bool isAdded;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final isScreenMedium = MediaQuery.of(context).size.width > ScreenSize.small;

    return SizedBox(
      width: 182.0,
      height: 384.0,
      child: Card(
        margin: EdgeInsets.only(
            left: 0.0,
            top: 0.0,
            right: isScreenMedium ? 16.0 : 8.0,
            bottom: 2.0),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                ImageNetworkAtom(
                  src: image,
                  width: 182.0,
                  height: 182.0,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: isAdded
                        ? IconButtonAtom(
                            onPressed: onPressed,
                            backgroundColor: Colors.green,
                            icon: const Icon(Icons.check),
                          )
                        : IconButtonAtom(onPressed: onPressed)),
              ]),
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                subtitle,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              LabelAtom(text: label),
              Text(
                caption,
                style: theme.textTheme.labelSmall!
                    .copyWith(color: theme.hintColor),
              ),
              Flexible(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(footerText),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
