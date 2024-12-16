import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:yandeh_challenge/features/home/domain/usecases/get_sections.dart';
import 'package:yandeh_challenge/features/home/presentation/bloc/sections_bloc.dart';
import 'package:mockito/mockito.dart';

import '../../../../sample/section_sample.dart';
import 'sections_bloc_test.mocks.dart';

@GenerateMocks([GetSections])
void main() {
  late MockGetSections mockGetSections;
  late SectionsBloc sectionsBloc;

  setUp(() {
    mockGetSections = MockGetSections();
    sectionsBloc = SectionsBloc(getSections: mockGetSections);
  });

  group('SectionsBloc => ', () {
    test('initial state is SectionsInitial', () {
      expect(sectionsBloc.state, SectionsInitial());
    });

    blocTest<SectionsBloc, SectionsState>(
      'emits [SectionsLoading, SectionsLoaded] when GetSectionsEvent is added and successful',
      build: () {
        when(mockGetSections.call(originalSections: true, argument: 'test'))
            .thenAnswer((_) async => [sectionSample]);
        return sectionsBloc;
      },
      act: (bloc) => bloc.add(const GetSectionsEvent(
        originalSections: true,
        argument: 'test',
      )),
      expect: () => [
        SectionsLoading(),
        SectionsLoaded(sections: [sectionSample]),
      ],
      verify: (_) {
        verify(mockGetSections.call(originalSections: true, argument: 'test'))
            .called(1);
      },
    );

    blocTest<SectionsBloc, SectionsState>(
      'emits [SectionsLoading, SectionsEmpty] when GetSectionsEvent is added and no sections found',
      build: () {
        when(mockGetSections.call(originalSections: true, argument: 'test'))
            .thenAnswer((_) async => []);
        return sectionsBloc;
      },
      act: (bloc) => bloc.add(const GetSectionsEvent(
        originalSections: true,
        argument: 'test',
      )),
      expect: () => [
        SectionsLoading(),
        SectionsEmpty(),
      ],
      verify: (_) {
        verify(mockGetSections.call(originalSections: true, argument: 'test'))
            .called(1);
      },
    );

    blocTest<SectionsBloc, SectionsState>(
      'emits [SectionsLoading, SectionsError] when GetSectionsEvent is added and an exception occurs',
      build: () {
        when(mockGetSections.call(originalSections: true, argument: 'test'))
            .thenThrow(const HttpException('Error occurred'));
        return sectionsBloc;
      },
      act: (bloc) => bloc.add(const GetSectionsEvent(
        originalSections: true,
        argument: 'test',
      )),
      expect: () => [
        SectionsLoading(),
        const SectionsError(message: 'Error occurred'),
      ],
      verify: (_) {
        verify(mockGetSections.call(originalSections: true, argument: 'test'))
            .called(1);
      },
    );
  });
}
