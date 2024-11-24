import 'package:yandeh_challenge/feature/domain/entities/section.dart';

abstract class ISectionsRepository {
  Future<List<Section>> getSections({required bool? isOriginalSections});
}
