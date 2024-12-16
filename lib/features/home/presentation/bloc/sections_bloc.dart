import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:yandeh_challenge/features/home/domain/entities/section.dart';
import 'package:yandeh_challenge/features/home/domain/usecases/get_sections.dart';

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
      final sections = await getSections(
          originalSections: event.originalSections, argument: event.argument);
      if (sections.isNotEmpty &&
          sections.any((section) => section.products.isNotEmpty)) {
        emit(SectionsLoaded(sections: sections));
      } else {
        emit(SectionsEmpty());
      }
    } on HttpException catch (e) {
      emit(SectionsError(message: e.message));
    } catch (e, s) {
      emit(SectionsError(message: 'Erro: $e'));
      debugPrint('Erro bloc: $e');
      debugPrint('Stack trace: $s');
    }
  }
}
