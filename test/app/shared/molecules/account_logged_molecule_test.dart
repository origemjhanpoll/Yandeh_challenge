import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yandeh_challenge/app/shared/molecules/account_logged_molecule.dart';
import 'package:yandeh_challenge/app/shared/styles/sizes.dart';

void main() {
  const title = 'Test Title';
  const subtitle = 'Test Subtitle';
  group('AccountLoggedMolecule Widget => ', () {
    testWidgets(
      'should displays title and subtitle correctly on a small screen',
      (tester) async {
        tester.view.physicalSize = const Size(ScreenSize.small, 800);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AccountLoggedMolecule(
                title: title,
                subtitle: subtitle,
              ),
            ),
          ),
        );

        final titleFinder = find.text(title);
        expect(titleFinder, findsOneWidget);

        final subtitleFinder = find.text(subtitle);
        expect(subtitleFinder, findsOneWidget);

        final titleText = tester.widget<Text>(titleFinder);
        expect(titleText.textAlign, TextAlign.center);
        expect(titleText.style?.fontSize, 22);

        final subtitleText = tester.widget<Text>(subtitleFinder);
        expect(subtitleText.textAlign, TextAlign.center);
        expect(subtitleText.style?.fontSize, 14);
      },
    );

    testWidgets(
      'should displays title and subtitle correctly on a medium screen',
      (tester) async {
        tester.view.physicalSize = const Size(ScreenSize.small + 1, 800);
        tester.view.devicePixelRatio = 1.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AccountLoggedMolecule(
                title: title,
                subtitle: subtitle,
              ),
            ),
          ),
        );

        final titleFinder = find.text(title);
        expect(titleFinder, findsOneWidget);

        final subtitleFinder = find.text(subtitle);
        expect(subtitleFinder, findsOneWidget);

        final titleText = tester.widget<Text>(titleFinder);
        expect(titleText.textAlign, TextAlign.left);
        expect(titleText.style?.fontSize, 16);

        final subtitleText = tester.widget<Text>(subtitleFinder);
        expect(subtitleText.textAlign, TextAlign.left);
        expect(subtitleText.style?.fontSize, 12);
      },
    );
  });
}
