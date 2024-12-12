import 'package:flutter/material.dart';

class ImageNetworkAtom extends StatelessWidget {
  const ImageNetworkAtom({
    super.key,
    required this.src,
    this.semanticLabel,
    this.width,
    this.height,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.fit = BoxFit.cover,
  });

  final String? src;
  final String? semanticLabel;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: borderRadius,
        child: FadeInImage(
          imageErrorBuilder: (context, exception, stackTrace) {
            return SizedBox(
              width: width,
              height: height,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.blueGrey[50]),
                child: const Icon(
                  color: Colors.blueGrey,
                  Icons.dangerous_outlined,
                ),
              ),
            );
          },
          placeholder: const AssetImage('assets/placeholder.png'),
          image: NetworkImage(src ?? ''),
          fit: fit,
          height: height,
          width: width,
        ));
  }
}
