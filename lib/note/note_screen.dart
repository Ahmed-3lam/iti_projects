import 'package:flutter/material.dart';
import 'package:iti_projects/note/hive/hive_helper.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final _textFieldController = TextEditingController();

  @override
  void initState() {
    HiveHelper.getNotes(_refresh);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  
void _refresh(){
    setState(() {

    });
}
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('TextField in Dialog'),
                content: TextField(
                  controller: _textFieldController,
                  decoration: InputDecoration(hintText: "Text Field in Dialog"),
                ),
                actions: [
                  MaterialButton(
                    child: Text('CANCEL'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  MaterialButton(
                    child: Text('OK'),
                    onPressed: () {
                      if (_textFieldController.text.isNotEmpty) {
                        HiveHelper.addNote(_textFieldController.text);
                      }
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          ).then((value) => setState(() {}));
        },
        child: Icon(Icons.add),
      ),
      body:
      HiveHelper.notes.isEmpty?Center(child: CircularProgressIndicator(),):

      ListView.separated(
        itemCount: HiveHelper.notes.length,
        padding: EdgeInsets.all(20),
        separatorBuilder: (context, index) => SizedBox(
          height: 20,
        ),
        itemBuilder: (context, index) => _buildNoteItem(
          text: HiveHelper.notes[index],
          index: index,
        ),
      ),
    );
  }

  Widget _buildNoteItem({
    required String text,
    required int index,
  }) {
    return Stack(
      children: [
        Container(
          height: 200,
          width: 300,
          color: Colors.green,
          child: Center(
              child: Text(
            text,
            style: TextStyle(
              fontSize: 30,
            ),
          )),
        ),
        InkWell(
            onTap: () {
             HiveHelper.removeNote(index);
              _refresh();
            },
            child: Icon(
              Icons.delete,
              color: Colors.red,
            ))
      ],
    );
  }
}
