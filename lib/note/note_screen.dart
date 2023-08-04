import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_projects/note/cubit/note_cubit.dart';
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
  Widget build(BuildContext context) {
    final cubit = context.read<NoteCubit>();
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
          onPressed: () {
            cubit.clearNotes();
          },
          icon: const Icon(CupertinoIcons.delete),
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            _textFieldController.text = "";
            await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('TextField in Dialog'),
                  content: TextField(
                    controller: _textFieldController,
                    decoration:
                        const InputDecoration(hintText: "Text Field in Dialog"),
                  ),
                  actions: [
                    MaterialButton(
                      child: const Text('CANCEL'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    MaterialButton(
                      child: const Text('OK'),
                      onPressed: () {
                        if (_textFieldController.text.isNotEmpty) {
                          cubit.addNote(_textFieldController.text);
                        }
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            ).then((value) => setState(() {}));
          },
          child: const Icon(Icons.add),
        ),
        body: BlocBuilder<NoteCubit, NoteState>(
          builder: (context, state) {
            if (state is NoteLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else if (state is NoteEmptyState) {
              return const Center(
                child: Text(
                  "Empty",
                  style: TextStyle(fontSize: 50),
                ),
              );
            } else {
              return ListView.separated(
                itemCount: HiveHelper.notes.length,
                padding: const EdgeInsets.all(20),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemBuilder: (context, index) => _buildNoteItem(
                  text: HiveHelper.notes[index],
                  index: index,
                  cubit: cubit,
                ),
              );
            }
          },
        )
        );
  }

  Widget _buildNoteItem({
    required String text,
    required int index,
    required NoteCubit cubit,
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
                  title: const Text('TextField in Dialog'),
                  content: TextField(
                    controller: _textFieldController2,
                    decoration:
                        const InputDecoration(hintText: "Text Field in Dialog"),
                  ),
                  actions: [
                    MaterialButton(
                      child: const Text('CANCEL'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    MaterialButton(
                      child: const Text('OK'),
                      onPressed: () {
                        // HiveHelper.update(
                        //     index, _textFieldController2.text, _refresh);
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
              style: const TextStyle(
                fontSize: 30,
              ),
            )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
              onTap: () {
                cubit.removeNote(index);
              },
              child: const Icon(
                Icons.delete,
                color: Colors.red,
              )),
        )
      ],
    );
  }
}
