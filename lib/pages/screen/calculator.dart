import 'package:calculadora_imc/utils/calResult.dart';
import 'package:calculadora_imc/utils/result_screen.dart';
import 'package:calculadora_imc/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/responsive.dart';

enum Gender {
  male,
  female,
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  Color inactiveColor = Colors.black;
  Color activeColor = Colors.red;
  int height = 180;
  int weight = 30;
  int age = 15;
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Calculadora IMC"),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: selectedGender == Gender.male
                              ? activeColor
                              : inactiveColor),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.mars,
                            color: Colors.white,
                            size: 45,
                          ),
                          SizedBox(
                            height: Responsive.of(context).ip(2),
                          ),
                          Text(
                            "Hombre",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: selectedGender == Gender.female
                              ? activeColor
                              : inactiveColor),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.venus,
                            color: Colors.white,
                            size: 45,
                          ),
                          SizedBox(
                            height: Responsive.of(context).ip(2),
                          ),
                          Text(
                            "Mujer",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Responsive.of(context).ip(2),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: inactiveColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "ALTURA",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "CM",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        overlayColor: Color(0x291DE9B6),
                        inactiveTrackColor: Colors.grey,
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 16,
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 30,
                        ),
                        thumbColor: Color(0x291DE9B6),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 100,
                        max: 250,
                        onChanged: (double v) {
                          setState(() {
                            height = v.round();
                          });
                        },
                      ))
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: inactiveColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "PESO",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: Responsive.of(context).ip(2),
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: Responsive.of(context).ip(2),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blueGrey,
                              child: IconButton(
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: Responsive.of(context).ip(2),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.blueGrey,
                              child: IconButton(
                                icon: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (weight > 10) {
                                      weight--;
                                    }
                                  });
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: inactiveColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "EDAD",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: Responsive.of(context).ip(2),
                        ),
                        Text(
                          age.toString(),
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: Responsive.of(context).ip(2),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blueGrey,
                              child: IconButton(
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: Responsive.of(context).ip(2),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.blueGrey,
                              child: IconButton(
                                icon: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (age > 5) {
                                      age--;
                                    }
                                  });
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 80,
              color: Colors.blueAccent,
              child: Center(
                child: Text(
                  "CALCULAR",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            onTap: () {
              navigateToResultScreen(12);
            },
          )
        ],
      ),
    );
  }

  void navigateToResultScreen(double result) {
    CalculateResult obj = CalculateResult(height, weight);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ResultScreen(
                obj.calculateResult(), obj.msg, obj.getDescription())));
  }
}
