import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:yandeh_challenge/feature/domain/entities/section.dart';
import 'package:yandeh_challenge/feature/domain/usecases/get_sections.dart';

part 'sections_event.dart';
part 'sections_state.dart';

class SectionsBloc extends Bloc<SectionsEvent, SectionsState> {
  final GetSections getSections;

  SectionsBloc({required this.getSections}) : super(SectionsInitial()) {
    on<GetSectionsEvent>(_getSections);
  }

  void _getSections(GetSectionsEvent event, Emitter<SectionsState> emit) async {
    emit(SectionsLoading());
    try {
      final sections = await getSections();
      emit(SectionsLoaded(sections: sections));
    } catch (e, s) {
      debugPrint('Erro: $e');
      debugPrint('Stack trace: $s');
    }
  }
}
