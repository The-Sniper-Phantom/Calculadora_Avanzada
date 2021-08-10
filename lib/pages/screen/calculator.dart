import 'package:calculadora_imc/utils/app_colors.dart';
import 'package:calculadora_imc/utils/calResult.dart';
import 'package:calculadora_imc/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class CalculatorScreen extends StatefulWidget {
  CalculatorScreen({Key key}) : super(key: key);

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  int gender = 0;
  int bodyMassIndex = 0;
  int idealBodyWeight = 0;
  int leanBodyMass = 0;

  Results results = Results();
  @override
  void dispose() {
    weightController.dispose();
    heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora IMC', style: appBar),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0.0,
        leading: GestureDetector(
          child: Icon(Icons.info_outline),
          onTap: () {
            return showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      "Informacion.",
                      style: textStyle,
                      textAlign: TextAlign.center,
                    ),
                    content: Text(
                      "Ingrese sus datos para poder calcular su Indice de Masa Muscular(IMC), los datos ingresados deben ser: Altura(CM) y su Peso(KG), tambien debe seleccionar su genero (Hombre/Mujer)",
                      style: textStyle,
                      textAlign: TextAlign.center,
                    ),
                    actions: <Widget>[
                      FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'OK',
                            style: textStyle,
                          ))
                    ],
                  );
                });
          },
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              Text('Seleccione su genero', style: textStyle),
              SizedBox(height: 10),
              GroupButton(
                  selectedColor: Colors.blueAccent,
                  selectedTextStyle: selectedButton,
                  unselectedTextStyle: textStyle,
                  borderRadius: BorderRadius.circular(100),
                  isRadio: true,
                  spacing: 10,
                  buttons: ["Hombre", "Mujer"],
                  onSelected: (index, isSelected) {
                    gender = index;
                  }),
              SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text('Ingrese su peso(KG)', style: textStyle),
                        SizedBox(height: responsive.ip(1)),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          width: MediaQuery.of(context).size.width / 2,
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Ingrese su Peso';
                              }
                              return null;
                            },
                            controller: weightController,
                            obscureText: false,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintStyle: textStyle,
                              hintText: 'Ingrese KG',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'Peso',
                              labelStyle: textStyle,
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text('Ingrese su altura(CM)', style: textStyle),
                        SizedBox(height: responsive.ip(1)),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          width: MediaQuery.of(context).size.width / 2,
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Ingrese su Estatura';
                              }
                              return null;
                            },
                            controller: heightController,
                            obscureText: false,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintStyle: textStyle,
                              hintText: 'Ingrese CM',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'Estatura',
                              labelStyle: textStyle,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 100,
                    padding: EdgeInsets.only(top: 20, left: 12),
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('IMC', style: textStyle2),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "$bodyMassIndex kg/m\u00B2",
                            style: resultText,
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 100,
                    padding: EdgeInsets.only(top: 20, left: 6, right: 6),
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Peso Ideal', style: textStyle2),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "$idealBodyWeight kg/m",
                            style: resultText,
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 100,
                    padding: EdgeInsets.only(top: 20, left: 12),
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Masa Corporal Magra',
                            style: textStyle2,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "$leanBodyMass kg/m",
                            style: resultText,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: ListTile(
                  title: bodyMassIndex > 0 && bodyMassIndex <= 18
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                          child: Text(
                            'Desnutricion',
                            style: titleListTitle,
                            textAlign: TextAlign.center,
                          ),
                        )
                      : bodyMassIndex > 18 && bodyMassIndex <= 25
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              child: Text(
                                'Normal',
                                style: titleListTitle,
                                textAlign: TextAlign.center,
                              ),
                            )
                          : bodyMassIndex > 25 && bodyMassIndex <= 30
                              ? Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4.0),
                                  child: Text(
                                    'Sobrepeso',
                                    style: titleListTitle,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              : bodyMassIndex > 30
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Text(
                                        'Obesidad',
                                        style: titleListTitle,
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  : null,
                  subtitle: bodyMassIndex > 0 && bodyMassIndex <= 18
                      ? Text(
                          'Su IMC es $bodyMassIndex, se presenta cuando no se obtienen calorías suficientes o la cantidad adecuada de nutrientes principales, como las vitaminas y los minerales, que se necesitan para una buena salud.',
                          style: subtitleListTitle,
                          textAlign: TextAlign.center,
                        )
                      : bodyMassIndex > 18 && bodyMassIndex <= 25
                          ? Text(
                              'Su IMC es $bodyMassIndex, se considera un peso saludable  aquel que nos permite mantenernos en un buen estado de salud y calidad de vida.  También se entiende como  los valores de peso, dentro de los cuales, no existe riesgo para la salud de la persona.',
                              style: subtitleListTitle,
                              textAlign: TextAlign.center,
                            )
                          : bodyMassIndex > 25 && bodyMassIndex <= 30
                              ? Text(
                                  'Su IMC es $bodyMassIndex, las personas están subiendo de peso debido a las elecciones de alimentos no saludables (como comidas rápidas) y a los hábitos familiares (como comer frente al televisor en lugar de hacerlo alrededor de una mesa).',
                                  textAlign: TextAlign.center,
                                )
                              : bodyMassIndex > 30
                                  ? Text(
                                      'Su IMC es $bodyMassIndex, la obesidad puede causar diversas complicaciones a la salud, como problemas al corazón y a la circulación, colesterol y presión arterial alta, problemas respiratorios, artritis, problemas al hígado, problemas con la fertilidad y, en casos extremos, diabetes y cáncer.',
                                      style: subtitleListTitle,
                                      textAlign: TextAlign.center,
                                    )
                                  : null,
                ),
              ),
              Expanded(
                  child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(40.0),
                  child: SizedBox(
                    height: 40,
                    width: 100,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      color: Colors.blueAccent,
                      child: Text(
                        'Calcular',
                        style: calculateButton,
                      ),
                      onPressed: () {
                        setState(() {
                          bodyMassIndex = results
                              .bodyMassIndexResult(
                                  weightController, heightController)
                              .round()
                              .toInt();
                          idealBodyWeight = results
                              .idealBodyWweightResult(heightController, gender)
                              .round()
                              .toInt();
                          leanBodyMass = results
                              .leanBodyMass(
                                  weightController, heightController, gender)
                              .round()
                              .toInt();
                        });
                      },
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
