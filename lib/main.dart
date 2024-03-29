import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:iti_projects/bmi/cubit/bmi_cubit.dart';
import 'package:iti_projects/ecommerce/features/home/cubit/home_cubit.dart';
import 'package:iti_projects/ecommerce/features/login/cubit/login_cubit.dart';
import 'package:iti_projects/ecommerce/network/dio_helper.dart';
import 'package:iti_projects/language_cubit/language_cubit.dart';
import 'package:iti_projects/note/cubit/note_cubit.dart';

import 'bloc_observer.dart';
import 'ecommerce/features/create_account/cubit/create_account_cubit.dart';
import 'ecommerce/features/home/home_screen.dart';
import 'note/hive/boxes.dart';

void main() async {
  // init hive
  await Hive.initFlutter();
  await Hive.openBox(notesBox);
  Bloc.observer = AppBlocObserver();
  DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LanguageCubit(),
        ),
        BlocProvider(
          create: (context) => BmiCubit(),
        ),
        BlocProvider(
          create: (context) => NoteCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => CreateAccountCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit()..getBanners()..getProducts(),
        ),
      ],
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return GetMaterialApp(
              title: 'Flutter Demo',
              locale: context.read<LanguageCubit>().local,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              debugShowCheckedModeBanner: false,
              // theme: ThemeData.dark().copyWith(
              //   scaffoldBackgroundColor: Color(0xFF0A0E21),
              //   primaryColor: Color(0xFF0A0E21),
              //   textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
              // ),
              home:HomeScreen(),
          );
        },
      ),
    );
  }
}
