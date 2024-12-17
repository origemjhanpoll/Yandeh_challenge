import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yandeh_challenge/app/shared/atoms/shopping_list_atom.dart';

void main() {
  group('ShoppingListAtom Widget => ', () {
    testWidgets('should display the default icon and the counter correctly',
        (tester) async {
      const int itemCount = 5;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ShoppingListAtom(count: itemCount),
          ),
        ),
      );

      expect(find.text(itemCount.toString()), findsOneWidget);
      expect(find.byIcon(Icons.shopping_cart_outlined), findsOneWidget);
    });

    testWidgets('should call onPressed when the button is pressed',
        (tester) async {
      bool buttonPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ShoppingListAtom(
              count: 3,
              onPressed: () => buttonPressed = true,
            ),
          ),
        ),
      );

      final filledButtonIconFinder = find.ancestor(
          of: find.byIcon(Icons.shopping_cart_outlined),
          matching: find.byWidgetPredicate((widget) => widget is FilledButton));

      await tester.tap(filledButtonIconFinder);
      await tester.pumpAndSettle();

      expect(buttonPressed, isTrue);
    });

    testWidgets('should use the correct button style', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ShoppingListAtom(count: 2),
          ),
        ),
      );
      final filledButtonIconFinder = find.ancestor(
          of: find.byIcon(Icons.shopping_cart_outlined),
          matching: find.byWidgetPredicate((widget) => widget is FilledButton));

      final FilledButton button = tester.widget(filledButtonIconFinder);

      expect(button.style!.backgroundColor!.resolve({}), Colors.red);
    });
  });
}
