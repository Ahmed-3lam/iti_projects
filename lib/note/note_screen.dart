import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_projects/note/hive/hive_helper.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final _textFieldController = TextEditingController();
  final _textFieldController2 = TextEditingController();

  @override
  void initState() {
    HiveHelper.getNotes(_refresh);
    super.initState();
  }

  void _refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        onPressed: () {
          HiveHelper.clearAllNotes(_refresh);
        },
        icon: Icon(CupertinoIcons.delete),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _textFieldController.text = "";
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
      body: HiveHelper.notes.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
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
        InkWell(
          onTap: () async {
            _textFieldController2.text = HiveHelper.notes[index];
            await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('TextField in Dialog'),
                  content: TextField(
                    controller: _textFieldController2,
                    decoration:
                        InputDecoration(hintText: "Text Field in Dialog"),
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
                        HiveHelper.update(
                            index, _textFieldController2.text, _refresh);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            ).then((value) => setState(() {}));
          },
          child: Container(
            height: 300,
            width: 400,
            decoration: BoxDecoration(
                color: index == 0
                    ? Colors.red.withOpacity(.3)
                    : index % 2 == 0
                        ? Colors.amber.withOpacity(.2)
                        : Colors.green.withOpacity(.2),
                borderRadius: BorderRadius.circular(20)),
            child: Center(
                child: Text(
              text,
              style: TextStyle(
                fontSize: 30,
              ),
            )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
              onTap: () {
                HiveHelper.removeNote(index);
                _refresh();
              },
              child: Icon(
                Icons.delete,
                color: Colors.red,
              )),
        )
      ],
    );
  }



}
