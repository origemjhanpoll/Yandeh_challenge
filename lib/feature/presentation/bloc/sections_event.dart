part of 'sections_bloc.dart';

abstract class SectionsEvent extends Equatable {
  const SectionsEvent();

  @override
  List<Object?> get props => [];
}

final class GetSectionsEvent extends SectionsEvent {
  final bool? originalSections;
  final String? argument;

  const GetSectionsEvent({this.originalSections, this.argument});

  @override
  List<Object?> get props => [originalSections, argument];
}
