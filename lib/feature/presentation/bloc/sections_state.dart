part of 'sections_bloc.dart';

abstract class SectionsState extends Equatable {
  const SectionsState();

  @override
  List<Object> get props => [];
}

class SectionsInitial extends SectionsState {}

class SectionsLoading extends SectionsState {}

class SectionsLoaded extends SectionsState {
  final List<Section> sections;
  const SectionsLoaded({required this.sections});

  @override
  List<Object> get props => [sections];
}

class SectionsEmpty extends SectionsState {}

class SectionsWarning extends SectionsState {}

class SectionsError extends SectionsState {}
