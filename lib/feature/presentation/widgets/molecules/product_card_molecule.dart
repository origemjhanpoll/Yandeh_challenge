import 'package:flutter/material.dart';
import 'package:yandeh_challenge/feature/presentation/widgets/atoms/icon_button_atom.dart';
import 'package:yandeh_challenge/feature/presentation/widgets/atoms/image_network_atom.dart';

class ProductCardMolecule extends StatelessWidget {
  const ProductCardMolecule({
    super.key,
    required this.src,
    required this.price,
    required this.name,
    required this.unitContent,
    required this.unitMessure,
    required this.ean,
    required this.package,
    required this.packageQuantity,
  });
  final String? src;
  final String price;
  final String name;
  final int unitContent;
  final String unitMessure;
  final String ean;
  final String package;
  final int packageQuantity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 182.0,
      height: 392.0,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                ImageNetworkAtom(src: src),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButtonAtom(onPressed: () {}),
                ),
              ]),
              Text(price),
              Text(
                name,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              Text('$unitContent $unitMessure'),
              Text(ean),
              Flexible(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text('$packageQuantity $package'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
