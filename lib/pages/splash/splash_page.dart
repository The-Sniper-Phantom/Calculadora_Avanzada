import 'package:after_layout/after_layout.dart';
//import 'package:calculadora_imc/main_screen.dart';
import 'package:calculadora_imc/pages/login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:calculadora_imc/libs/auth.dart';
import 'package:calculadora_imc/pages/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  static final routeName = 'Splash';
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with AfterLayoutMixin {
  @override
  void afterFirstLayout(BuildContext context) {
    Auth.instance.user.then((FirebaseUser user) {
      if (user != null) {
        Navigator.pushReplacementNamed(context, HomePage.routeName);
      } else {
        Navigator.pushReplacementNamed(context, LoginPage.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
