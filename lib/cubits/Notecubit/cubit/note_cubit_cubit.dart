// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:noteapp/models/notemodel.dart';
import 'package:noteapp/utils/constants.dart';

part 'note_cubit_state.dart';

class NoteCubitCubit extends Cubit<NoteCubitState> {
  NoteCubitCubit() : super(NoteCubitInitial());
  fetchNotes() {
    emit(NoteCubLoading());
    try {
      var noteBox = Hive.box<Notemodel>(kNotesBox);
      List<Notemodel> notes = noteBox.values.toList();
      emit(NoteCubitSuccess(notes));
    } catch (e) {
      emit(NoteCubitFailure(e.toString()));
    }
  }
}
