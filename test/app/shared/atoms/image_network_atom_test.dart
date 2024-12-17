import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yandeh_challenge/app/shared/atoms/image_network_atom.dart';

void main() {
  group('ImageNetworkAtom Widget => ', () {
    testWidgets('should displays the placeholder correctly', (tester) async {
      const widget = MaterialApp(
        home: Scaffold(
          body: ImageNetworkAtom(
            src: 'https://example.com/image.jpg',
            width: 100,
            height: 100,
          ),
        ),
      );

      await tester.pumpWidget(widget);

      final fadeInImageFinder = find.byType(FadeInImage);
      final fadeInImage = tester.widget<FadeInImage>(fadeInImageFinder);

      expect(fadeInImageFinder, findsOneWidget);
      expect((fadeInImage.placeholder as AssetImage).assetName,
          'assets/placeholder.png');
    });

    testWidgets('should displays the error icon when the image fails to load',
        (tester) async {
      const widget = MaterialApp(
        home: Scaffold(
          body: ImageNetworkAtom(
            src: 'https://example.com/invalid-image.jpg',
            width: 100,
            height: 100,
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await tester.pump();
      final fadeInImage = tester.widget<FadeInImage>(find.byType(FadeInImage));

      fadeInImage.imageErrorBuilder!(
        tester.element(find.byType(FadeInImage)),
        Exception('Image failed to load'),
        StackTrace.empty,
      );

      await tester.pump();
      expect(find.byIcon(Icons.dangerous_outlined), findsOneWidget);

      final sizeWidget =
          tester.widgetList<SizedBox>(find.byType(SizedBox)).first;
      expect(sizeWidget.height, 100);
      expect(sizeWidget.width, 100);
      expect(sizeWidget.child.runtimeType, DecoratedBox);
    });

    testWidgets(
        'should displays the image correctly when a valid URL is provided',
        (tester) async {
      const widget = MaterialApp(
        home: Scaffold(
          body: ImageNetworkAtom(
            src: 'https://example.com/valid-image.jpg',
            width: 100,
            height: 100,
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await tester.pump();
      final fadeInImage = tester.widget<FadeInImage>(find.byType(FadeInImage));

      expect(fadeInImage.image,
          const NetworkImage("https://example.com/valid-image.jpg"));
    });
  });
}
