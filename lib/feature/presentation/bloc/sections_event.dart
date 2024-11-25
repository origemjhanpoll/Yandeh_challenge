part of 'sections_bloc.dart';

abstract class SectionsEvent extends Equatable {
  const SectionsEvent();

  @override
  List<Object> get props => [];
}

final class GetSectionsEvent extends SectionsEvent {}
