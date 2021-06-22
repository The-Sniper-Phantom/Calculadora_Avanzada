import 'package:calculadora_imc/pages/screen/account.dart';
import 'package:calculadora_imc/pages/screen/calculator.dart';
import 'package:calculadora_imc/pages/screen/food.dart';
import 'package:calculadora_imc/pages/screen/home.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static final routeName = 'home';
  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<HomePage> {
  int selectedIndex = 0;
  final screen = [
    CalculatorScreen(),
    FoodScreen(),
    HomeScreen(),
    AccountScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: selectedIndex,
        items: [
          Icon(Icons.calculate_outlined, size: 30),
          Icon(Icons.no_food_outlined, size: 30),
          Icon(Icons.home_outlined, size: 30),
          Icon(Icons.account_circle_outlined, size: 30),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        animationCurve: Curves.easeInBack,
        animationDuration: const Duration(milliseconds: 300),
      ),
      body: screen[selectedIndex],
    );
  }
}
