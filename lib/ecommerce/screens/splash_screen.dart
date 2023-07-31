import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iti_projects/const.dart';
import 'package:iti_projects/ecommerce/screens/auth_screen.dart';
import 'package:iti_projects/ecommerce/screens/onboarding_screen.dart';

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



    /// Splash 1
    if (widget.image=="assets/images/logo.png") {
      ///time 3 seconds
      Timer(
        const Duration(seconds: 3),
        () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) => const SplashScreen(
                image: "assets/images/splash2.png",
                color: Colors.white,
              ),
            ),

          );
          } );

    }

    ///Splash2
    if (widget.image=="assets/images/splash2.png") {
      Timer(
          const Duration(seconds: 3),
          () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (BuildContext context) => OnboardingScreen(num: 1,)),
            );
          },
      );
    }
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

/// Navigation
/// (1) push: screen 1 >>> screen2
/// back : screen2 >>> screen1

/// (2)push replacment
/// push replac: screen1>> screen2
/// back:screen1 not found again
