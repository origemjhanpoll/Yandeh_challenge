import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yandeh_challenge/features/home/domain/usecases/get_sections.dart';
import 'package:yandeh_challenge/features/home/domain/repositories/i_sections_repository.dart';

import '../../../../sample/data_sample.dart';
import 'get_sections_test.mocks.dart';

@GenerateMocks([ISectionsRepository])
void main() async {
  late MockISectionsRepository mockSectionsRepository;
  late GetSections getSections;

  setUp(() {
    mockSectionsRepository = MockISectionsRepository();
    getSections = GetSections(mockSectionsRepository);
  });

  tearDown(() {
    mockSectionsRepository;
  });

  group('GetSections Usecase => ', () {
    test('should return a list of section when called successfully', () async {
      when(mockSectionsRepository.getSections(
              argument: 'test', originalSections: true))
          .thenAnswer((_) async => dataSample);

      final result =
          await getSections.call(argument: 'test', originalSections: true);

      expect(result, dataSample);
      verify(mockSectionsRepository.getSections(
              argument: 'test', originalSections: true))
          .called(1);
    });

    test('should throw a exception when the repository fails', () async {
      when(mockSectionsRepository.getSections(
              argument: 'test', originalSections: true))
          .thenThrow(Exception('Falha ao obter as sections'));

      expect(
          () async =>
              await getSections.call(argument: 'test', originalSections: true),
          throwsException);
      verify(mockSectionsRepository.getSections(
              argument: 'test', originalSections: true))
          .called(1);
    });
  });
}
