import 'package:flutter/material.dart';
import 'package:iti_projects/ecommerce/screens/onboarding_screen.dart';
import 'package:iti_projects/ecommerce/screens/splash_screen.dart';



void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
home:
SplashScreen(image: "assets/images/logo.png",color: Color(0xFF40AA54),),
    );
  }
}







