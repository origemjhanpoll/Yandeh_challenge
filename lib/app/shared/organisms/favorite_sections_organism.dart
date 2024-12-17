import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yandeh_challenge/app/shared/atoms/image_network_atom.dart';
import 'package:yandeh_challenge/app/shared/molecules/favorite_card_molecule.dart';
import 'package:yandeh_challenge/app/shared/styles/sizes.dart';

class FavoriteCardType {
  final Color color;
  final String title;
  final String image;

  FavoriteCardType(
      {required this.color, required this.title, required this.image});
}

class FavoriteSectionsOrganism extends StatelessWidget {
  const FavoriteSectionsOrganism({
    super.key,
    required this.backgroundImage,
    this.onPressed,
    required this.favoriteList,
  });

  final String backgroundImage;
  final void Function()? onPressed;

  final List<FavoriteCardType> favoriteList;
  @override
  Widget build(BuildContext context) {
    final isScreenMedium = MediaQuery.of(context).size.width > ScreenSize.small;

    return SizedBox(
      height: 317.0,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ImageNetworkAtom(
              height: 280.0,
              width: double.infinity,
              src: backgroundImage,
              borderRadius: const BorderRadius.all(Radius.circular(40.0)),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            width: double.infinity,
            height: 280.0,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(40.0)),
              color: const Color.fromARGB(255, 31, 73, 33).withAlpha(1000),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 64.0, left: 16.0, right: 16.0),
            child: Center(
              child: SvgPicture.asset(
                'assets/svg/logo_solid.svg',
                height: isScreenMedium ? 86 : 66.0,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 115.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 48),
                shrinkWrap: true,
                itemCount: favoriteList.length,
                itemBuilder: (context, index) {
                  final favorite = favoriteList[index];
                  return FavoriteCardMolecule(
                    color: favorite.color,
                    image: favorite.image,
                    title: favorite.title,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
