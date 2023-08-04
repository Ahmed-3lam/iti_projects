import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:iti_projects/note/cubit/note_cubit.dart';

import 'ecommerce/screens/splash_screen.dart';
import 'note/hive/boxes.dart';
import 'note/note_screen.dart';


void main() async {
  // init hive
  await Hive.initFlutter();
  await Hive.openBox(notesBox);

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit()..getMyNotes(),
      child: GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const NoteScreen()

      ),
    );
  }
}




