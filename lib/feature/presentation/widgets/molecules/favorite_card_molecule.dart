import 'package:flutter/material.dart';
import 'package:yandeh_challenge/feature/presentation/widgets/atoms/image_network_atom.dart';

class FavoriteCardMolecule extends StatelessWidget {
  const FavoriteCardMolecule({
    super.key,
    required this.image,
    required this.title,
    this.onPressed,
    required this.color,
  });
  final String? image;
  final String title;
  final Color color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SizedBox(
      height: 115.0,
      width: 280.0,
      child: Card(
        color: color,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Positioned(
                bottom: -10,
                right: -50,
                child: ImageNetworkAtom(
                  src: image,
                  height: 123.0,
                  width: 185.0,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w700, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
