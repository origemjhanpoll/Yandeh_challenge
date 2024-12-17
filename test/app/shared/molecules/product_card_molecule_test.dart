import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yandeh_challenge/app/shared/atoms/icon_button_atom.dart';
import 'package:yandeh_challenge/app/shared/atoms/image_network_atom.dart';
import 'package:yandeh_challenge/app/shared/molecules/product_card_molecule.dart';

void main() {
  group('ProductCardMolecule Widget => ', () {
    testWidgets('Should render ProductCardMolecule correctly', (tester) async {
      const image = 'https://via.placeholder.com/182';
      const title = 'Product Title';
      const subtitle = 'This is the product subtitle';
      const label = 'Label';
      const caption = 'Caption text';
      const footerText = 'Footer information';
      const isAdded = false;

      bool buttonPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProductCardMolecule(
              image: image,
              title: title,
              subtitle: subtitle,
              label: label,
              caption: caption,
              footerText: footerText,
              isAdded: isAdded,
              onPressed: () => buttonPressed = true,
            ),
          ),
        ),
      );

      expect(find.text(title), findsOneWidget);
      expect(find.text(subtitle), findsOneWidget);
      expect(find.text(label), findsOneWidget);
      expect(find.text(caption), findsOneWidget);
      expect(find.text(footerText), findsOneWidget);
      expect(find.byType(ImageNetworkAtom), findsOneWidget);
      expect(find.byType(IconButtonAtom), findsOneWidget);

      expect(buttonPressed, isFalse);
      await tester.tap(find.byType(IconButtonAtom));
      await tester.pumpAndSettle();
      expect(buttonPressed, isTrue);
    });

    testWidgets('Should show check icon when isAdded is true', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProductCardMolecule(
              image: 'https://via.placeholder.com/182',
              title: 'Product Title',
              subtitle: 'Subtitle',
              label: 'Label',
              caption: 'Caption',
              footerText: 'Footer',
              isAdded: true,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.check), findsOneWidget);
    });
  });
}
