import 'package:flutter/material.dart';
import 'package:yandeh_challenge/app/widgets/atoms/image_network_atom.dart';

class BannerCardMolecule extends StatelessWidget {
  const BannerCardMolecule({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.textButtton,
    required this.color,
    this.onPressed,
  });
  final String? image;
  final String title;
  final String subtitle;
  final String textButtton;
  final Color color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 280.0, minHeight: 184.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ImageNetworkAtom(
              height: 280.0,
              width: double.infinity,
              src: image,
              borderRadius: const BorderRadius.all(Radius.circular(40.0)),
            ),
            Container(
              width: double.infinity,
              height: 280.0,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(40.0)),
                color: Colors.black.withOpacity(.5),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                      color: color, borderRadius: BorderRadius.circular(50.0)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.headlineLarge!.copyWith(
                          fontWeight: FontWeight.w700, color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 32.0),
                  child: Text(
                    subtitle,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                OutlinedButton(
                    onPressed: onPressed,
                    child: Text(
                      textButtton,
                      style: theme.textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
