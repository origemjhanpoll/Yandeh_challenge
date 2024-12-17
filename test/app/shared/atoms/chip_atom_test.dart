import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yandeh_challenge/app/shared/atoms/chip_atom.dart';

void main() {
  group('ChipAtom Widget => ', () {
    testWidgets('should must display the label correctly', (tester) async {
      const String label = 'Test Label';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ChipAtom(
              label: label,
              selected: false,
            ),
          ),
        ),
      );

      expect(find.text(label), findsOneWidget);
    });

    testWidgets('should apply the customization correctly when selected',
        (tester) async {
      const String label = 'Selected Label';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ChipAtom(
              label: label,
              selected: true,
              color: Colors.blue,
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text(label));
      expect(textWidget.style?.color, Colors.white);

      final choiceChip = tester.widget<ChoiceChip>(find.byType(ChoiceChip));
      expect(choiceChip.selectedColor, Colors.blue);
    });

    testWidgets('should apply default color when no color is provided',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ChipAtom(
              label: 'Default Color Test',
              selected: true,
            ),
          ),
        ),
      );

      final choiceChip = tester.widget<ChoiceChip>(find.byType(ChoiceChip));
      expect(choiceChip.selectedColor, Colors.red);
    });

    testWidgets('should catch the callback correctly', (tester) async {
      bool callbackCalled = false;
      bool selectedState = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ChipAtom(
              label: 'Callback Test',
              selected: selectedState,
              onSelected: (bool value) {
                callbackCalled = true;
                selectedState = value;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(ChoiceChip));
      await tester.pumpAndSettle();

      expect(callbackCalled, isTrue);
      expect(selectedState, isTrue);
    });
  });
}
