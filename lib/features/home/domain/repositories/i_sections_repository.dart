import 'package:yandeh_challenge/features/home/domain/entities/section.dart';

abstract class ISectionsRepository {
  Future<List<Section>> getSections({required bool? originalSections});
}
