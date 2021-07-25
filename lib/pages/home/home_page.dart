import 'package:calculadora_imc/pages/screen/account.dart';
import 'package:calculadora_imc/pages/screen/calculator.dart';
import 'package:calculadora_imc/pages/screen/food.dart';
import 'package:calculadora_imc/pages/screen/home.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:calculadora_imc/utils/responsive.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static final routeName = 'home';
  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<HomePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPages(),
      bottomNavigationBar: buildBottomNavigation(),
    );
  }

  Widget buildPages() {
    switch (index) {
      case 1:
        return FoodScreen();
      case 2:
        return RutinasScreen();
      case 3:
        return AccountScreen();

      case 0:
      default:
        return CalculatorScreen();
    }
  }

  Widget buildBottomNavigation() {
    final Responsive responsive = Responsive.of(context);
    final inactiveColor = Colors.grey;
    return BottomNavyBar(
      backgroundColor: Colors.black,
      itemCornerRadius: 32,
      containerHeight: responsive.ip(6.5),
      selectedIndex: index,
      onItemSelected: (index) => setState(() => this.index = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
            icon: Icon(Icons.calculate_outlined),
            title: Text('Calculadora'),
            textAlign: TextAlign.center,
            activeColor: Colors.white,
            inactiveColor: inactiveColor),
        BottomNavyBarItem(
            icon: Icon(Icons.no_food_outlined),
            title: Text('Alimentacion'),
            textAlign: TextAlign.center,
            activeColor: Colors.white,
            inactiveColor: inactiveColor),
        BottomNavyBarItem(
            icon: Icon(Icons.accessibility),
            title: Text('Rutina'),
            textAlign: TextAlign.center,
            activeColor: Colors.white,
            inactiveColor: inactiveColor),
        BottomNavyBarItem(
            icon: Icon(Icons.account_circle_outlined),
            title: Text('Perfil'),
            textAlign: TextAlign.center,
            activeColor: Colors.white,
            inactiveColor: inactiveColor)
      ],
    );
  }
}
