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
        leading: Icon(Icons.menu),
        actions: [
          Icon(Icons.person, size: 28),
          SizedBox(width: 12),
        ],
      );
}
