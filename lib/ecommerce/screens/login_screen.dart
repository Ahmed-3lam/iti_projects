import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_projects/const.dart';
import 'package:iti_projects/ecommerce/widget/build_btn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool obscureText = true;

  void _togglePasswordText() {
    obscureText = !obscureText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 100.0,
            bottom: 100,
            left: 20,
            right: 20,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/svg/logo2.svg"),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Welcome to our",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF16162E),
                            ),
                          ),
                          Text(
                            "E-Grocery",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  _textFieldTitle("Phone Number"),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      hintText: "01***********",
                      filled: true,
                      fillColor: Colors.grey[300],
                      border: _buildOutlineInputBorder(),
                      focusedBorder: _buildOutlineInputBorder(),
                      enabledBorder: _buildOutlineInputBorder(),
                      errorBorder: _buildOutlineInputBorder(),
                      disabledBorder: _buildOutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  _textFieldTitle("Password"),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: obscureText,
                    decoration: InputDecoration(
                      hintText: "5@*****",
                      filled: true,
                      suffixIcon: InkWell(
                        onTap: _togglePasswordText,
                        child: Icon(
                          obscureText
                              ? CupertinoIcons.eye_fill
                              : CupertinoIcons.eye_slash_fill,
                          color: Colors.black,
                        ),
                      ),
                      fillColor: Colors.grey[300],
                      border: _buildOutlineInputBorder(),
                      focusedBorder: _buildOutlineInputBorder(),
                      enabledBorder: _buildOutlineInputBorder(),
                      errorBorder: _buildOutlineInputBorder(),
                      disabledBorder: _buildOutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Forget Password?"),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  buildButton(
                    text: "Login",
                    textColor: Colors.white,
                    btnColor: primaryColor,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      _buildSocialMediaButton(
                        name: "Google",
                        image: "assets/images/gLogo.png",
                        color: Colors.red,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      _buildSocialMediaButton(
                        name: "Apple",
                        image: "assets/images/appleLogo.png",
                        color: Colors.black,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t Have Account?",
                        style: TextStyle(
                          color: Color(0xFF8B8B97),
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            color: Color(0xFF40AA54),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialMediaButton({
    required String name,
    required String image,
    required Color color,
  }) {
    return Container(
      width: 174,
      height: 56,
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
        ),
        borderRadius: BorderRadius.circular(11),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 40,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            name,
            style: TextStyle(
              color: color,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(7),
    );
  }

  Widget _textFieldTitle(String text) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            color: Color(0xFF8B8B97),
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
