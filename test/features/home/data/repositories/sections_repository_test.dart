import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yandeh_challenge/features/home/data/datasources/remote_datasource.dart';
import 'package:yandeh_challenge/features/home/data/repositories/sections_repository.dart';

import '../../../../load_json.dart';
import '../../../../sample/data_sample.dart';
import 'sections_repository_test.mocks.dart';

@GenerateMocks([RemoteDataSource])
void main() async {
  late SectionsRepository repository;
  late MockRemoteDataSource mockRemoteDataSource;

  final mockJson = await loadJson('test/json/data.json');

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    repository = SectionsRepository(mockRemoteDataSource);
  });

  tearDown(() {
    mockRemoteDataSource;
  });

  group('getSections => ', () {
    test('should return a list of Section when getSections succeeds', () async {
      when(mockRemoteDataSource.getSections(
        argument: null,
        originalSections: null,
      )).thenAnswer((_) async => mockJson);

      final result = await repository.getSections(argument: null);

      expect(result, dataSample);
      verify(mockRemoteDataSource.getSections(
        argument: null,
        originalSections: null,
      ));
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test('should throw HttpException when getSections throws HttpException',
        () async {
      when(mockRemoteDataSource.getSections(
              argument: anyNamed('argument'),
              originalSections: anyNamed('originalSections')))
          .thenThrow(const HttpException('Network error'));

      final call = repository.getSections;

      expect(() => call(argument: 'test'), throwsA(isA<HttpException>()));
      verify(mockRemoteDataSource.getSections(
        argument: 'test',
        originalSections: null,
      ));
    });

    test('should throw generic Exception for unexpected errors', () async {
      when(mockRemoteDataSource.getSections(
              argument: anyNamed('argument'),
              originalSections: anyNamed('originalSections')))
          .thenThrow(Exception('Unexpected error'));

      final call = repository.getSections;

      expect(() => call(argument: 'test'), throwsA(isA<Exception>()));
      verify(mockRemoteDataSource.getSections(
        argument: 'test',
        originalSections: null,
      ));
    });
  });
}
