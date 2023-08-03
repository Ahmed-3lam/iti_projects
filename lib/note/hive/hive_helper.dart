import 'package:hive/hive.dart';
import 'package:iti_projects/note/hive/boxes.dart';



///Disk

class HiveHelper {
  static List<String> notes = [];

  /// ADD
  static void addNote(String title) async {
    notes.add(title);
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

  static getNotes(void Function() refresh) async {
    Future.delayed(Duration(seconds: 3)).then((value) {
      notes =   Hive.box(notesBox).get(notesBox);
      refresh();
    });

  }
}
