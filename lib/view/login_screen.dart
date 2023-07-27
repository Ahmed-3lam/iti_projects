import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: 300,
                    width: 400,
                    child: Image.asset(
                      "assets/images/login_ic.png",
                      fit: BoxFit.fill,
                    )),
                Row(
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 300,
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                        label: Text("UserName"),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 0),
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 300,
                  height: 50,
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(

                        label: Text("Password"),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 0),
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                width: 300,
                height: 50,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Center(child: Text("Sign In",style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
