import 'package:calculadora_imc/utils/app_colors.dart';
import 'package:calculadora_imc/widget/line_chart_widget.dart';
import 'package:calculadora_imc/widget/exercises_widget.dart';
import 'package:flutter/material.dart';

class RutinasScreen extends StatelessWidget {
  const RutinasScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            buildAppBar(context),
            ExercisesWidget(),
          ],
        ),
      );

  SliverAppBar buildAppBar(BuildContext context) => SliverAppBar(
        flexibleSpace: FlexibleSpaceBar(background: LineChartWidget()),
        expandedHeight: MediaQuery.of(context).size.height * 0.5,
        title: Text('Estadisticas'),
        centerTitle: true,
        pinned: true,
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
                      "Podras encontrar ejercicios dependiendo tu nivel actual puede ser: Principiante, Intermedio y Avanzado, dependiendo tu nivel elige una seccion y luego selecciona la parte del cuerpo que desees entrenar.",
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
      );
}
