import 'package:flutter/material.dart';
import 'package:iti_projects/const.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              width: double.infinity,
              child: Image.asset(
                "assets/images/background1.png",
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
                  _buildButton(
                    text: "Continue with Email or Phone",
                    textColor: Colors.white,
                    btnColor: primaryColor,
                  ),
                  const SizedBox(height: 20,),
                  _buildButton(
                    text: "Create an account",
                    textColor: Colors.black,
                    btnColor: Colors.white,
                  ),
                ],
              ),)
        ],
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required Color textColor,
    required Color btnColor,
  }) {
    return Container(
      height: 56,
      width: 374,
      decoration: BoxDecoration(
          color: btnColor, borderRadius: BorderRadius.circular(20)),
      child: Center(
          child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 16),
      )),
    );
  }
}
