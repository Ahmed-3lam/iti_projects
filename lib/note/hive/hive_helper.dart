import 'package:hive/hive.dart';
import 'package:iti_projects/note/hive/boxes.dart';

///Disk




class HiveHelper {
  static List<String> notes = [];

  /// ADD
  static void addNote(String title) async {
    notes.add(title);

    /// put
    await Hive.box(notesBox).put(
      notesBox,
      notes,
    );

  }

  /// remove
  static void removeNote(int index) async {
    notes.removeAt(index);

    await Hive.box(notesBox).put(
      notesBox,
      notes,
    );

  }

  /// get notes
  static getNotes(void Function() refresh) async {
    Future.delayed(Duration(seconds: 3)).then((value) {
      notes = Hive.box(notesBox).get(notesBox);
      refresh();
    });
  }



  /// clear all notes
  static clearAllNotes(void Function() refresh) async {
    notes.clear();
    print(notes);
    await Hive.box(notesBox).clear();
    refresh();
  }


  /// update
 static update(int index,String newTitle,void Function() refresh)async{

    notes[index]=newTitle;
    await Hive.box(notesBox).put(
      notesBox,
      notes,
    );
    refresh();
 }




}
