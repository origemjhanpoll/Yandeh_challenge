import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yandeh_challenge/app/shared/atoms/icon_elevation_button_atom.dart';

void main() {
  group('IconElevationButtonAtom Widget => ', () {
    testWidgets('should displays icon and handles onPressed', (tester) async {
      bool wasPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: IconElevationButtonAtom(
              icon: Icons.add,
              onPressed: () {
                wasPressed = true;
              },
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(wasPressed, isFalse);
      await tester.tap(find.byType(IconButton));
      await tester.pump();
      expect(wasPressed, isTrue);
    });

    testWidgets('should has correct styling', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: IconElevationButtonAtom(
              icon: Icons.add,
            ),
          ),
        ),
      );

      final materialFinder = find.byType(Material);

      final materialWidget =
          tester.widgetList<Material>(materialFinder).elementAt(1);

      expect(materialWidget.color, Colors.white);
      expect(materialWidget.elevation, 2.0);
      expect(materialWidget.borderRadius, BorderRadius.circular(16.0));

      final iconFinder = find.byType(IconButton);
      final iconWidget = tester.widget<IconButton>(iconFinder);

      expect(materialWidget.color, Colors.white);
      expect(iconWidget.color, Colors.black);
      expect((iconWidget.icon as Icon).icon, Icons.add);
    });
  });
}
