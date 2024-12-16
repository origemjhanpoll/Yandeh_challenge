import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:yandeh_challenge/features/home/data/datasources/remote_datasource.dart';
import 'package:yandeh_challenge/features/home/domain/repositories/i_sections_repository.dart';
import 'package:yandeh_challenge/features/home/domain/usecases/get_sections.dart';
import 'package:yandeh_challenge/features/home/presentation/bloc/sections_bloc.dart';
import 'package:http/http.dart' as http;

import 'injection_test.mocks.dart';

@GenerateMocks([http.Client, RemoteDataSource, ISectionsRepository])
void main() {
  final di = GetIt.instance;

  setUp(() {
    di.reset();
  });

  test('Should inject dependencies properly', () {
    final mockClient = MockClient();
    final mockRemoteDataSource = MockRemoteDataSource();
    final mockSectionsRepository = MockISectionsRepository();

    di.registerLazySingleton<http.Client>(() => mockClient);
    di.registerLazySingleton<RemoteDataSource>(() => mockRemoteDataSource);
    di.registerLazySingleton<ISectionsRepository>(() => mockSectionsRepository);
    di.registerLazySingleton(() => GetSections(mockSectionsRepository));
    di.registerFactory(() => SectionsBloc(getSections: di<GetSections>()));

    final client = di<http.Client>();
    final remoteDataSource = di<RemoteDataSource>();
    final repository = di<ISectionsRepository>();
    final useCase = di<GetSections>();
    final bloc = di<SectionsBloc>();

    expect(client, mockClient);
    expect(remoteDataSource, mockRemoteDataSource);
    expect(repository, mockSectionsRepository);
    expect(useCase, isA<GetSections>());
    expect(bloc, isA<SectionsBloc>());
  });
}
