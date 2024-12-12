import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yandeh_challenge/features/home/domain/entities/section.dart';
import 'package:yandeh_challenge/app/widgets/atoms/image_network_atom.dart';
import 'package:yandeh_challenge/app/widgets/molecules/favorite_card_molecule.dart';
import 'package:yandeh_challenge/app/widgets/styles/sizes.dart';

class FavoriteSectionsOrganism extends StatelessWidget {
  const FavoriteSectionsOrganism({
    super.key,
    required this.backgroundImage,
    this.onPressed,
    required this.sections,
  });

  final String backgroundImage;
  final List<Section> sections;
  final void Function()? onPressed;

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
                'assets/logo.svg',
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
                itemCount: sections.length,
                itemBuilder: (context, index) {
                  final section = sections[index];
                  return FavoriteCardMolecule(
                    color: const Color(0xFF007C61),
                    image:
                        'https://s3-alpha-sig.figma.com/img/e81d/d19f/c679b588aa27d26228f45f0ed3d0c4ef?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=AnMeSvZhknlskIb82A445AT0VhPuOXuX8bfMU7eUu9iZ4KBbKAFr1TX2L2ox1nbnhr2b1uuwIOYg57IiMmnAq21zDppes5ZCvwdy0m0-nky2ERwaxo~kIRjX-l1qZZHKji7VefQmLatyBp3U7cry4ZEKxaAilFBlnv~ywd5frE7gdAADdL7ZZhPC~TgkU0B~Ce2XxxiJ3OH09EpLcxMwYwwtzqPGBun4Kxkc0CHKzYpzHnRCaFLplF3CY2EYgWjA~-D5SmQ23wz8oV3OAYonqH4y8nO2xd94fQMwZElYtKClvLrDh2U2wSvsEro29CYx~AFoJV3hDu~izCUbbwH2ww__',
                    title: section.section,
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
