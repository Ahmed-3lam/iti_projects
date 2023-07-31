import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import 'ecommerce/screens/splash_screen.dart';

void main() async {
  await Hive.initFlutter();

  var box = await Hive.openBox('box1');

  box.put("name", "Ahmed");

  var name = box.get("name");

  print("=================================================  "+name);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:

// MainScreen()
          SplashScreen(
        image: "assets/images/logo.png",
        color: Color(0xFF40AA54),
      ),
    );
  }
}
