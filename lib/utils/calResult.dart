import 'dart:math';
import 'package:flutter/material.dart';

class CalculateResult {
  final int height;
  final int weight;
  double result;
  String msg = "";

  CalculateResult(this.height, this.weight);

  String calculateResult() {
    result = weight / pow(height / 100, 2);
    return result.toStringAsFixed(1);
  }

  String getDescription() {
    if (result > 25) {
      msg = "EN SOBREPESO";
      return "Beba abundante agua, entre 1,5 y 2 L al día sin obsesionarse. Evite el consumo de alimentos procesados y ultraprocesados o alimentos fritos o cocinados con excesiva grasa.";
    } else if (result > 18.5) {
      msg = "NORMAL";
      return "La clave para alcanzar y mantener un peso saludable está en hacer ejercicio regularmente y tener unos buenos hábitos alimentarios.";
    } else if (result < 18.5) {
      msg = "EN DESNUTRICION";
      return "Una dieta equilibrada sana se recomienda para la prevención de la desnutrición.";
    }
  }
}
