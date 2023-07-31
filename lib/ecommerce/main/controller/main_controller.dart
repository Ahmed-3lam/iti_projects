


import 'package:flutter/material.dart';
import 'package:iti_projects/ecommerce/screens/auth_screen.dart';
import 'package:iti_projects/ecommerce/screens/home_screen.dart';
import 'package:iti_projects/ecommerce/screens/login_screen.dart';

class MainController{

  int selectedIndex=0;

  final List<Widget> screenList=[
    HomeScreen(),
    const AuthScreen(),
    const  LoginScreen(),
    Container(color: Colors.red,)
  ];




}