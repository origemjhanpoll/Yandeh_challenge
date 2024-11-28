import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yandeh_challenge/feature/domain/entities/section.dart';
import 'package:yandeh_challenge/feature/presentation/widgets/atoms/image_network_atom.dart';
import 'package:yandeh_challenge/feature/presentation/widgets/molecules/favorite_card_molecule.dart';
import 'package:yandeh_challenge/feature/presentation/widgets/styles/sizes.dart';

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
                        'https://s3-alpha-sig.figma.com/img/e81d/d19f/c679b588aa27d26228f45f0ed3d0c4ef?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=IlneJH1~Azamfr2iQ06~ffKo4Ju3IHiJc57GjzhJ5HWoFKFibt-7REXZCXLhyE2kPHYe5xUUiB6LbnKrYwwdvypRT0-uDV-4XaUWBPbD7xuLfa7O~DcdcnbGemlpXccsugz64GnyAuzUWhNtSzr34tEkwPxnkTQKxeGZSy3Km-NofNOOeZs2tU1WRgPH0voBHl5M2~8GXhV6LbARPeL4-c40ll1~cKiOrMGF9zxcmWlVEn4K66uYl9PIMMMwIQBn0fYzmhZ9Q9x2CDj8ld65oThxgEzJ2avdQq~edfZw1opmTVN5noIs8Z~am6SXt1Sv~kMfUyocQkBEPokmTlH4PA__',
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
