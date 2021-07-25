import 'dart:async';
import 'package:calculadora_imc/pages/home/home_page.dart';
import 'package:calculadora_imc/pages/login/login_page.dart';
import 'package:calculadora_imc/pages/splash/splash_page.dart';
import 'package:calculadora_imc/widget/animated_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/responsive.dart';

const blue = Color(0xFF4781ff);
const kTitleStyle = TextStyle(
    fontSize: 30,
    color: Colors.white,
    fontFamily: "Oranienbaum",
    fontWeight: FontWeight.bold);
const kSubtitleStyle =
    TextStyle(fontSize: 18, color: Color(0xFF88869f), fontFamily: "Benne");

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
      /*  theme: ThemeData(
          //brightness: Brightness.dark,
          ), */
      home: SplashScreen(),
      routes: {
        HomePage.routeName: (_) => HomePage(),
        SplashPage.routeName: (_) => SplashPage(),
        MainPage.routeName: (_) => MainPage(),
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
    Timer(Duration(seconds: 2), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => MainPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/pages/loading/logo.jpg',
              width: responsive.wp(50),
            ),
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
  static final routeName = 'onboarding';
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final pageController = new PageController(initialPage: 0);

  void nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 600), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Container(
        child: PageView(
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Slide(
                prod: Image.asset('assets/pages/onboarding/page_1.png',
                    width: responsive.wp(80),
                    height: responsive.hp(95),
                    color: Colors.white),
                title: "QUE ES IMC",
                subtitle:
                    "Una medida de la obesidad se determina mediante el índice de masa corporal (IMC).que se calcula dividiendo los kilogramos de peso por el cuadrado de la estatura en metros (IMC = peso [kg]/ estatura [m2]).",
                onNext: nextPage),
            Slide(
                prod: Image.asset(
                  'assets/pages/onboarding/page_2.png',
                  color: Colors.white,
                  width: responsive.wp(50),
                  height: responsive.hp(65),
                ),
                title: "RUTINAS DE EJERCICIO.",
                subtitle:
                    "Una rutina de definición muscular es un programa de entrenamiento donde el principal objetivo es reducir nuestro porcentaje de grasa corporal pero manteniendo el músculo que hemos ganado durante nuestras rutinas de fuerza y volumen.",
                onNext: nextPage),
            Slide(
                prod: Image.asset(
                  'assets/pages/onboarding/page_3.png',
                  width: responsive.wp(70),
                  height: responsive.hp(85),
                  color: Colors.white,
                ),
                title: "NUTRICION",
                subtitle:
                    "La cantidad de nutriente que se recomienda diariamente para un grupo de personas dependiendo de su edad y sexo. Las recomendaciones se calculan en base a los requerimientos nutricionales de los individuos.",
                onNext: nextPage),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        onPrimary: Colors.black,
                        elevation: 10.0,
                        shadowColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        textStyle: TextStyle(
                            color: Colors.pink,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Oranienbaum')),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SplashPage()));
                    },
                    child: Text('COMENZAR'),
                  ),
                ],
              ),
            ),
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
    final Responsive responsive = Responsive.of(context);

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
              SizedBox(height: responsive.ip(2)),
              Text(subtitle,
                  style: kSubtitleStyle, textAlign: TextAlign.center),
              SizedBox(height: responsive.ip(3)),
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
