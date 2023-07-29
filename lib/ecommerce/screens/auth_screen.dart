import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iti_projects/const.dart';
import 'package:iti_projects/ecommerce/screens/login_screen.dart';
import 'package:iti_projects/ecommerce/widget/build_btn.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String image = "assets/images/background1.png";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () => _changeImage());
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              width: double.infinity,
              child: Image.asset(
                image,
                fit: BoxFit.fill,
              )),
          Container(
            width: double.infinity,
            color: Colors.black.withOpacity(.3),
          ),
          Positioned(
            top: 100,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome to our",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF16162E),
                  ),
                ),
                Text(
                  "E-Grocery",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Column(
              children: [
                buildButton(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  text: "Continue with Email or Phone",
                  textColor: Colors.white,
                  btnColor: primaryColor,
                ),
                const SizedBox(
                  height: 20,
                ),
                buildButton(
                  text: "Create an account",
                  textColor: Colors.black,
                  btnColor: Colors.white,

                ),
              ],
            ),
          )
        ],
      ),
    );
  }



  void _changeImage() {
    if (image == "assets/images/background1.png") {
      image = "assets/images/background2.png";
    } else {
      image = "assets/images/background1.png";
    }
    setState(() {});
  }
}
