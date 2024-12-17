import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:yandeh_challenge/features/home/data/datasources/remote_datasource.dart';

import '../../../../load_json.dart';
import 'remote_datasource_test.mocks.dart';

@GenerateMocks([http.Client])
void main() async {
  late RemoteDataSource remoteDataSource;
  late MockClient mockClient;
  const baseUrl =
      'https://gateway-smartforce.yandeh.com.br/process/candidates/search-products';

  final mockJson = await loadJson('test/json/data.json');

  setUp(() {
    mockClient = MockClient();
    remoteDataSource =
        RemoteDataSource(client: mockClient, token: 'test-token');
  });

  tearDown(() {
    mockClient;
  });

  group('GetSections Remote Datasource => ', () {
    test(
        'should return a map with sections and candidate when the response code is 200 and not empty sections',
        () async {
      final uri = Uri.parse('$baseUrl?argument=%2A');

      when(mockClient.get(
        uri,
        headers: {
          'token': 'test-token',
          'Content-Type': 'application/json',
        },
      )).thenAnswer(
        (_) async => http.Response(jsonEncode(mockJson), 200),
      );

      final result = await remoteDataSource.getSections(argument: '*');

      expect(result, mockJson);
      verify(mockClient.get(
        uri,
        headers: {
          'token': 'test-token',
          'Content-Type': 'application/json',
        },
      )).called(1);
    });
    test('should return a map when the response code is 200 and empty sections',
        () async {
      const validResponse = {
        "status": "success",
        "data": {"sections": []}
      };
      final uri = Uri.parse('$baseUrl?argument=%2A&original=true');

      when(mockClient.get(
        uri,
        headers: {
          'token': 'test-token',
          'Content-Type': 'application/json',
        },
      )).thenAnswer(
        (_) async => http.Response(jsonEncode(validResponse), 200),
      );

      final result = await remoteDataSource.getSections(
          argument: '*', originalSections: true);

      expect(result, validResponse);
      verify(mockClient.get(
        uri,
        headers: {
          'token': 'test-token',
          'Content-Type': 'application/json',
        },
      )).called(1);
    });

    test(
        'should throw HttpException with message when the response contains an error message',
        () async {
      const errorResponse = '{"message": "Invalid token"}';
      final uri = Uri.parse('$baseUrl?argument=%2A');

      when(mockClient.get(
        uri,
        headers: {
          'token': 'test-token',
          'Content-Type': 'application/json',
        },
      )).thenAnswer(
        (_) async => http.Response(errorResponse, 400),
      );

      expect(
        () =>
            remoteDataSource.getSections(argument: '*', originalSections: null),
        throwsA(isA<HttpException>().having(
          (e) => e.message,
          'message',
          'Invalid token',
        )),
      );
    });
  });
}
