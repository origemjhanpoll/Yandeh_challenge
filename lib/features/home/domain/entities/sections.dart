import 'package:yandeh_challenge/features/home/domain/entities/section.dart';

class Sections {
  final List<Section> sections;

  const Sections({required this.sections});

  factory Sections.fromJson(Map<String, dynamic> json) {
    return Sections(
      sections: (json['sections'] as List<dynamic>)
          .map((section) => Section.fromJson(section))
          .toList(),
    );
  }

  Sections copyWith({List<Section>? sections}) {
    return Sections(
      sections: sections ?? this.sections,
    );
  }
}
