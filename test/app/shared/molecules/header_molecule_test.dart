import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yandeh_challenge/app/shared/molecules/header_molecule.dart';
import 'package:yandeh_challenge/app/shared/styles/sizes.dart';

void main() {
  group('HeaderMolecule Widget => ', () {
    testWidgets('should display title and text button correctly',
        (tester) async {
      const title = 'Test Title';
      const textButton = 'Test Button';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HeaderMolecule(
              title: title,
              textButtton: textButton,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text(title), findsOneWidget);
      expect(find.text(textButton), findsOneWidget);
    });

    testWidgets('should display description when provided', (tester) async {
      const title = 'Test Title';
      const description = 'Test Description';
      const textButton = 'Test Button';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HeaderMolecule(
              title: title,
              description: description,
              textButtton: textButton,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text(description), findsOneWidget);
    });

    testWidgets('should not display description when it is null',
        (tester) async {
      const title = 'Test Title';
      const textButton = 'Test Button';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HeaderMolecule(
              title: title,
              textButtton: textButton,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Test Description'), findsNothing);
    });

    testWidgets('should call onPressed when button is clicked', (tester) async {
      bool wasPressed = false;
      const title = 'Test Title';
      const textButton = 'Test Button';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HeaderMolecule(
              title: title,
              textButtton: textButton,
              onPressed: () {
                wasPressed = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text(textButton));
      await tester.pumpAndSettle();

      expect(wasPressed, isTrue);
    });

    testWidgets('should adjust layout for small screens', (tester) async {
      const title = 'Test Title';
      const description = 'Test Description';
      const textButton = 'Test Button';

      tester.view.physicalSize = const Size(ScreenSize.small, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HeaderMolecule(
              title: title,
              description: description,
              textButtton: textButton,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text(description), findsNothing);
    });
    testWidgets('should call onPressed when the button is clicked',
        (WidgetTester tester) async {
      bool wasPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HeaderMolecule(
              title: 'Test Title',
              textButtton: 'Test Button',
              onPressed: () {
                wasPressed = true;
              },
            ),
          ),
        ),
      );

      final buttonFinder = find.text('Test Button');

      expect(wasPressed, isFalse);
      await tester.tap(buttonFinder);
      await tester.pumpAndSettle();
      expect(wasPressed, isTrue);
    });
  });
}
