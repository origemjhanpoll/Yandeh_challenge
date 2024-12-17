import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yandeh_challenge/app/shared/atoms/image_network_atom.dart';
import 'package:yandeh_challenge/app/shared/molecules/favorite_card_molecule.dart';
import 'package:yandeh_challenge/app/shared/organisms/favorite_sections_organism.dart';

void main() {
  group('FavoriteSectionsOrganism Widget => ', () {
    testWidgets('should renders FavoriteSectionsOrganism with provided data',
        (tester) async {
      final favoriteList = [
        FavoriteCardType(
          color: Colors.red,
          title: 'Favorite 1',
          image: 'assets/images/favorite1.png',
        ),
        FavoriteCardType(
          color: Colors.blue,
          title: 'Favorite 2',
          image: 'assets/images/favorite2.png',
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FavoriteSectionsOrganism(
              backgroundImage: 'https://example.com/image.png',
              favoriteList: favoriteList,
            ),
          ),
        ),
      );

      final imageNetworkAtomFinder = find.byType(ImageNetworkAtom);

      expect(imageNetworkAtomFinder, findsNWidgets(3));

      expect(find.byType(SvgPicture), findsOneWidget);

      expect(find.byType(FavoriteCardMolecule),
          findsNWidgets(favoriteList.length));

      for (var favorite in favoriteList) {
        expect(find.text(favorite.title), findsOneWidget);
      }
    });

    testWidgets('should check horizontal scroll functionality', (tester) async {
      final favoriteList = List.generate(
        4,
        (index) => FavoriteCardType(
          color: Colors.green,
          title: 'Favorite $index',
          image: 'assets/images/favorite$index.png',
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FavoriteSectionsOrganism(
              backgroundImage: 'https://example.com/image.png',
              favoriteList: favoriteList,
            ),
          ),
        ),
      );

      expect(find.text('Favorite 0'), findsOneWidget);
      expect(find.text('Favorite 1'), findsOneWidget);
      expect(find.text('Favorite 2'), findsOneWidget);

      await tester.drag(find.byType(ListView), const Offset(-300.0, 0.0));
      await tester.pumpAndSettle();

      expect(find.text('Favorite 3'), findsOneWidget);
    });
  });
}
