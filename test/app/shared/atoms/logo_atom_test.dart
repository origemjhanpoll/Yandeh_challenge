import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yandeh_challenge/app/shared/atoms/logo_atom.dart';

void main() {
  group('LogoAtom Widget => ', () {
    testWidgets('should renders correctly with given asset and dimensions',
        (tester) async {
      const String testAsset = 'assets/logo.svg';

      const double testWidth = 100.0;
      const double testHeight = 50.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: LogoAtom(
              asset: testAsset,
              width: testWidth,
              height: testHeight,
            ),
          ),
        ),
      );

      final svgPictureFinder = find.byType(SvgPicture);
      expect(svgPictureFinder, findsOneWidget);

      final SvgPicture svgPicture = tester.widget<SvgPicture>(svgPictureFinder);
      expect(svgPicture.width, testWidth);
      expect(svgPicture.height, testHeight);
    });

    testWidgets('should renders without width and height', (tester) async {
      const String testAsset = 'assets/logo.svg';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: LogoAtom(
              asset: testAsset,
            ),
          ),
        ),
      );

      final svgPictureFinder = find.byType(SvgPicture);
      expect(svgPictureFinder, findsOneWidget);

      final SvgPicture svgPicture = tester.widget<SvgPicture>(svgPictureFinder);
      expect(svgPicture.width, isNull);
      expect(svgPicture.height, isNull);
    });
  });
}
