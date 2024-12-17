import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yandeh_challenge/app/shared/atoms/icon_button_atom.dart';

void main() {
  group('IconButtonAtom Widget => ', () {
    testWidgets('should renders correctly and triggers onPressed callback',
        (tester) async {
      bool wasPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: IconButtonAtom(
              onPressed: () {
                wasPressed = true;
              },
              backgroundColor: Colors.blue,
              color: Colors.yellow,
            ),
          ),
        ),
      );

      final buttonFinder = find.byType(IconButtonAtom);
      expect(buttonFinder, findsOneWidget);

      final iconButton = tester.widget<IconButton>(buttonFinder);
      expect(iconButton.style!.backgroundColor,
          const WidgetStatePropertyAll<Color?>(Colors.blue));
      expect(iconButton.color, Colors.yellow);

      expect(wasPressed, isFalse);
      await tester.tap(buttonFinder);
      await tester.pump();
      expect(wasPressed, isTrue);
    });
  });
}
