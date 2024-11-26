import 'package:yandeh_challenge/feature/domain/entities/section.dart';
import 'package:yandeh_challenge/feature/domain/repositories/i_sections_repository.dart';

class GetSections {
  final ISectionsRepository repository;

  GetSections(this.repository);

  Future<List<Section>> call({bool? originalSections, String? argument}) async {
    return await repository.getSections(
      argument: argument,
      originalSections: originalSections,
    );
  }
}
