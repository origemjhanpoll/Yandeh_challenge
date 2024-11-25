import 'package:yandeh_challenge/feature/data/datasources/remote_datasource.dart';
import 'package:yandeh_challenge/feature/domain/entities/section.dart';
import 'package:yandeh_challenge/feature/domain/repositories/i_sections_repository.dart';

class SectionsRepository extends ISectionsRepository {
  final RemoteDataSource remote;
  SectionsRepository(this.remote);

  @override
  Future<List<Section>> getSections({required bool? isOriginalSections}) async {
    final sections = await remote.getSections();

    if (sections != null) {
      return (sections['sections'] as List)
          .map((element) => Section.fromJson(element))
          .toList();
    } else {
      throw Exception("No sections data found.");
    }
  }
}
