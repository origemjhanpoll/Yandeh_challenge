import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yandeh_challenge/app/shared/atoms/image_network_atom.dart';
import 'package:yandeh_challenge/app/shared/molecules/favorite_card_molecule.dart';

void main() {
  group('FavoriteCardMolecule Widget => ', () {
    testWidgets('should renders correctly', (WidgetTester tester) async {
      const String imageUrl = 'https://example.com/image.png';
      const String title = 'Favorite Item';
      const Color cardColor = Colors.blue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FavoriteCardMolecule(
              image: imageUrl,
              title: title,
              color: cardColor,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text(title), findsOneWidget);

      expect(find.byType(ImageNetworkAtom), findsOneWidget);

      final cardFinder = find.byType(Card);
      final cardWidget = tester.widget<Card>(cardFinder);
      expect(cardWidget.color, equals(cardColor));
    });

    testWidgets('should handles null image gracefully',
        (WidgetTester tester) async {
      const String title = 'Item with no image';
      const Color cardColor = Colors.red;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FavoriteCardMolecule(
              image: null,
              title: title,
              color: cardColor,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text(title), findsOneWidget);

      expect(find.byType(ImageNetworkAtom), findsOneWidget);
    });
  });
}
