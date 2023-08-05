import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:iti_projects/bmi/cubit/bmi_cubit.dart';
import 'package:iti_projects/note/cubit/note_cubit.dart';

import 'bloc_observer.dart';
import 'bmi/bmi_screen.dart';
import 'ecommerce/screens/splash_screen.dart';
import 'note/hive/boxes.dart';
import 'note/note_screen.dart';


void main() async {
  // init hive
  await Hive.initFlutter();
  await Hive.openBox(notesBox);
  Bloc.observer = AppBlocObserver();

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BmiCubit(),
      child: GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Color(0xFF0A0E21),
            primaryColor: Color(0xFF0A0E21),
            textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
          ),
          home:  BMICalculator()

      ),
    );
  }
}




