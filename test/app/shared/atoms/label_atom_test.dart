import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yandeh_challenge/app/shared/atoms/label_atom.dart';

void main() {
  group('LabelAtom Widget => ', () {
    testWidgets('should renders text correctly', (tester) async {
      const testText = 'Test Label';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: LabelAtom(
              text: testText,
            ),
          ),
        ),
      );

      expect(find.text(testText), findsOneWidget);
    });

    testWidgets('should applies correct style to text', (tester) async {
      const testText = 'Styled Label';

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(),
          home: const Scaffold(
            body: LabelAtom(
              text: testText,
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text(testText));
      final textStyle = textWidget.style;

      expect(textStyle?.fontWeight, FontWeight.w600);
      expect(textStyle?.color, const Color(0xFF1D1B20));
    });

    testWidgets('should renders with correct padding and decoration',
        (tester) async {
      const testText = 'Padded Label';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: LabelAtom(
              text: testText,
            ),
          ),
        ),
      );

      final decoratedBox =
          tester.widget<DecoratedBox>(find.byType(DecoratedBox));
      final paddingWidget = tester.widget<Padding>(find.byType(Padding));

      expect(decoratedBox.decoration, isA<BoxDecoration>());
      final decoration = decoratedBox.decoration as BoxDecoration;
      expect(decoration.color, const Color(0xFFE5F6FF));
      expect(decoration.borderRadius,
          const BorderRadius.all(Radius.circular(6.0)));

      expect(paddingWidget.padding,
          const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0));
    });
  });
}
