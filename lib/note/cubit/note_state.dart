part of 'note_cubit.dart';

@immutable
abstract class NoteState {}

class NoteInitial extends NoteState {}



class NoteLoadingState extends NoteState {}
class NoteSuccessState extends NoteState {}
class NoteEmptyState extends NoteState {}
