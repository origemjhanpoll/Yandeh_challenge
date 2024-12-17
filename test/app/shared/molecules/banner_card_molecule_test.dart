import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yandeh_challenge/app/shared/atoms/image_network_atom.dart';
import 'package:yandeh_challenge/app/shared/molecules/banner_card_molecule.dart';

void main() {
  group('BannerCardMolecule Widget => ', () {
    testWidgets('should renders correctly with given parameters',
        (tester) async {
      const testImage = 'https://example.com/test-image.jpg';
      const testTitle = 'Test Title';
      const testSubtitle = 'This is a test subtitle';
      const testButtonText = 'Click Me';
      const testColor = Colors.blue;

      bool buttonPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BannerCardMolecule(
              image: testImage,
              title: testTitle,
              subtitle: testSubtitle,
              textButtton: testButtonText,
              color: testColor,
              onPressed: () {
                buttonPressed = true;
              },
            ),
          ),
        ),
      );

      expect(find.byType(ImageNetworkAtom), findsOneWidget);
      final imageAtom =
          tester.widget<ImageNetworkAtom>(find.byType(ImageNetworkAtom));
      expect(imageAtom.src, testImage);

      expect(find.text(testTitle), findsOneWidget);

      expect(find.text(testSubtitle), findsOneWidget);

      expect(find.text(testButtonText), findsOneWidget);

      expect(buttonPressed, isFalse);
      await tester.tap(find.byType(OutlinedButton));
      await tester.pumpAndSettle();
      expect(buttonPressed, isTrue);
    });
  });
}
