part of 'sections_bloc.dart';

abstract class SectionsEvent extends Equatable {
  const SectionsEvent();

  @override
  List<Object?> get props => [];
}

final class GetSectionsEvent extends SectionsEvent {
  final bool? originalSections;

  const GetSectionsEvent({this.originalSections});

  @override
  List<Object?> get props => [originalSections];
}

final class SearchProductsEvent extends SectionsEvent {
  final String argument;

  const SearchProductsEvent({required this.argument});

  @override
  List<Object?> get props => [argument];
}
