import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iti_projects/const.dart';
import 'package:iti_projects/ecommerce/screens/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  final String image;
  final Color color;

  const SplashScreen({super.key, required this.image, required this.color});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    ///Splash 1
    if (isSplashFinished == 1) {
      ///time 3 seconds
      Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen(
              image: "assets/images/splash2.png",
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    //Splash2
    if (isSplashFinished == 2) {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (BuildContext context) => const AuthScreen()),
              ),
      );
    }

    isSplashFinished = 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.color,
      body: Center(
        child: Image.asset(
          widget.image,
          height: 70,
          width: 280,
        ),
      ),
    );
  }
}
