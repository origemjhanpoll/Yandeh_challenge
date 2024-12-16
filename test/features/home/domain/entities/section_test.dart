import 'package:flutter_test/flutter_test.dart';
import 'package:yandeh_challenge/features/home/domain/entities/section.dart';

import '../../../../load_json.dart';
import '../../../../sample/section_sample.dart';

void main() async {
  final mockJson = await loadJson('test/json/section.json');

  group('Section', () {
    test('should correctly create a Section from JSON', () {
      final result = Section.fromJson(mockJson);

      expect(result, sectionSample);
    });

    test('should create a modified copy using copyWith', () {
      final result = sectionSample.copyWith(
        section: 'Section Title',
        description: 'description in section test',
        products: [],
      );

      expect(
          result,
          const Section(
            section: 'Section Title',
            description: 'description in section test',
            products: [],
          ));
    });
  });
}
