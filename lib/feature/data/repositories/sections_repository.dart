import 'package:yandeh_challenge/feature/data/datasources/remote_datasource.dart';
import 'package:yandeh_challenge/feature/domain/entities/section.dart';
import 'package:yandeh_challenge/feature/domain/repositories/i_sections_repository.dart';

class SectionsRepository extends ISectionsRepository {
  final RemoteDataSource remote;
  SectionsRepository(this.remote);

  @override
  Future<List<Section>> getSections(
      {bool? originalSections, String? argument}) async {
    final sections = await remote.getSections(
      argument: argument,
      originalSections: originalSections,
    );

    if (sections != null) {
      return (sections['sections'] as List)
          .map((element) => Section.fromJson(element))
          .toList();
    } else {
      throw Exception("No sections data found.");
    }
  }
}
