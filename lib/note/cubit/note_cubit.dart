import 'package:bloc/bloc.dart';
import 'package:iti_projects/note/hive/hive_helper.dart';
import 'package:meta/meta.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  //Get notes method
  void getMyNotes() async {
    /// State is Loading
    emit(NoteLoadingState());

    await HiveHelper.getNotes();
    if (HiveHelper.notes.isEmpty) {
      /// State is Empty
      emit(NoteEmptyState());
    } else {
      /// state is success
      emit(NoteSuccessState());
    }
  }

// clear all notes
  void clearNotes()async {
    HiveHelper.clearAllNotes();
    emit(NoteEmptyState());
  }

  // add note
  void addNote(String title) {
    HiveHelper.addNote(title);
    emit(NoteSuccessState());
  }

  // remove note
  void removeNote(int index) {
    HiveHelper.removeNote(index);
    if (HiveHelper.notes.isEmpty) {
      emit(NoteEmptyState());
    } else {
      emit(NoteSuccessState());
    }
  }



}
