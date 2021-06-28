import 'package:flutter/material.dart';

class Results {
  double idealBodyWweightResult(
      TextEditingController heightController, int gender) {
    double result;
    double height = double.parse(heightController.text);

    if (gender == 0) {
      result = 50 + (2.3 / 2.54) * (height - 152.4);
    } else if (gender == 1) {
      result = 45.5 + (2.3 / 2.54) * (height - 152.4);
    }
    return result;
  }

  double leanBodyMass(TextEditingController weightController,
      TextEditingController heightController, int gender) {
    double result;
    double height = double.parse(heightController.text);
    double weight = double.parse(weightController.text);
    if (gender == 0) {
      result = (1.10 * weight) -
          (128 *
              ((weight * weight) /
                  ((100 * (height / 100)) * (100 * (height / 100)))));
    } else if (gender == 1) {
      result = (1.07 * weight) -
          (148 *
              ((weight * weight) /
                  ((100 * (height / 100)) * (100 * (height / 100)))));
    }
    return result;
  }

  double bodyMassIndexResult(TextEditingController weightController,
      TextEditingController heightController) {
    double result;
    double height = double.parse(heightController.text);
    double weight = double.parse(weightController.text);

    result = weight / ((height * height) / 10000);

    return result;
  }
}
