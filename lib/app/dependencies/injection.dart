import 'package:get_it/get_it.dart';
import 'package:yandeh_challenge/features/home/domain/repositories/i_sections_repository.dart';
import 'package:yandeh_challenge/features/home/domain/usecases/get_sections.dart';

final di = GetIt.instance;

Future<void> init() async {
  di.registerLazySingleton(() => GetSections(di<ISectionsRepository>()));
}
