import 'dart:async';
import 'package:calculadora_imc/pages/home/home_page.dart';
import 'package:calculadora_imc/pages/login/login_page.dart';
import 'package:calculadora_imc/pages/splash/splash_page.dart';
import 'package:calculadora_imc/widget/animated_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const blue = Color(0xFF4781ff);
const kTitleStyle = TextStyle(
    fontSize: 30,
    color: Color(0xFF01002f),
    fontFamily: "Benne",
    fontWeight: FontWeight.bold);
const kSubtitleStyle = TextStyle(
    fontSize: 18, color: Color(0xFF88869f), fontFamily: "Oranienbaum");

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora IMC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          //brightness: Brightness.dark,
          ),
      home: SplashScreen(),
      routes: {
        HomePage.routeName: (_) => HomePage(),
        SplashPage.routeName: (_) => SplashPage(),
        LoginPage.routeName: (_) => LoginPage(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => MainPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/pages/loading/logo.jpg', height: 150),
            SizedBox(height: 50),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final pageController = new PageController(initialPage: 0);

  void nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        child: PageView(
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Slide(
                prod: Image.asset('assets/pages/onboarding/page_1.jpg'),
                title: "QUE ES EL IMC?",
                subtitle:
                    "Una medida de la obesidad se determina mediante el índice de masa corporal (IMC).",
                onNext: nextPage),
            Slide(
                prod: Image.asset('assets/pages/onboarding/page_1.jpg'),
                title: "QUE ES EL IMC?",
                subtitle:
                    "Una medida de la obesidad se determina mediante el índice de masa corporal (IMC).",
                onNext: nextPage),
            Slide(
                prod: Image.asset('assets/pages/onboarding/page_1.jpg'),
                title: "QUE ES EL IMC?",
                subtitle:
                    "Una medida de la obesidad se determina mediante el índice de masa corporal (IMC).",
                onNext: nextPage),
            /*   Container(
             MainPage(),
            
            ), */
          ],
        ),
      )),
    );
  }
}

class Slide extends StatelessWidget {
  final Widget prod;
  final String title, subtitle;
  final VoidCallback onNext;

  const Slide({
    Key key,
    this.prod,
    this.title,
    this.subtitle,
    this.onNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Expanded(
          child: prod,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                title,
                style: kTitleStyle,
              ),
              SizedBox(height: 20),
              Text(subtitle,
                  style: kSubtitleStyle, textAlign: TextAlign.center),
              SizedBox(height: 35),
              ProgressButton(onNext: onNext),
            ],
          ),
        ),
      ],
    ));
  }
}

class ProgressButton extends StatelessWidget {
  final VoidCallback onNext;
  const ProgressButton({Key key, this.onNext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: 75,
      child: Stack(
        children: [
          AnimatedIndicator(
              duration: const Duration(seconds: 10),
              size: 75,
              callback: onNext),
          Center(
            child: GestureDetector(
              child: Container(
                height: 60,
                width: 60,
                child: Center(
                  child: SvgPicture.asset(
                    "assets/pages/onboarding/arrow.svg",
                    width: 25,
                    color: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(
                    color: blue, borderRadius: BorderRadius.circular(99)),
              ),
              onTap: onNext,
            ),
          )
        ],
      ),
    );
  }
}
