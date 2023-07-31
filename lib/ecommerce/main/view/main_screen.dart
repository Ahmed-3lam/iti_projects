import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iti_projects/ecommerce/main/controller/main_controller.dart';
import 'package:iti_projects/ecommerce/screens/auth_screen.dart';
import 'package:iti_projects/ecommerce/screens/home_screen.dart';
import 'package:iti_projects/ecommerce/screens/login_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _mainController =MainController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        items:const [
          Icon(Icons.home, size: 30),
          Icon(Icons.shopping_cart, size: 30),
          Icon(Icons.person, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        onTap: (index){
          _mainController.selectedIndex=index;
          setState(() {
          });
        },

      ),
      body: _mainController.screenList[ _mainController.selectedIndex]
    );
  }
}

/// MVC
/// MODEL VIEW CONTROLLER