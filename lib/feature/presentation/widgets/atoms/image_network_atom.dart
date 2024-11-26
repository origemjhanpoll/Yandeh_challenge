import 'package:flutter/material.dart';

class ImageNetworkAtom extends StatelessWidget {
  const ImageNetworkAtom({
    super.key,
    required this.src,
    this.semanticLabel,
    this.width = 182.0,
    this.height = 182.0,
  });

  final String? src;
  final String? semanticLabel;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        child: FadeInImage(
          imageErrorBuilder: (context, exception, stackTrace) {
            return SizedBox(
              width: width,
              height: height,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.blueGrey[50]),
                child: Icon(
                  color: Colors.blueGrey,
                  size: height / 4.0,
                  Icons.dangerous_outlined,
                ),
              ),
            );
          },
          placeholder: const AssetImage('assets/placeholder.png'),
          image: NetworkImage(src ?? ''),
          fit: BoxFit.cover,
          height: height,
          width: width,
        ));
  }
}
