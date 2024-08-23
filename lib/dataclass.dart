import 'dart:core';

class Data {
  int age;
  double length;
  double weight;
  late double bmi;

  Data(this.length, this.weight, this.age);

  String bmiCalculate() {
    double length2 = length / 100;
    bmi = (weight / (length2 * length2));
    return "BMI : ${bmi.toStringAsFixed(1)}";
  }

  String bmiComparison() {
    List list = [18.5, 25, 30, 35, 40, 500];
    List list2 = [
      "Weak",
      "Normal",
      "Fat",
      "Obesity Class 1",
      "Obesity Class 2",
      "Obesity Class 3",
    ];
    String variable = "";
    for (var element in list) {
      if (bmi <= element) {
        variable = list2[list.indexOf(element)];
        break;
      }
    }
    return "Result for your height: $variable";
  }

  String bmiComparisonByAge() {
    List list = [25, 35, 45, 55, 65, 500];
    List list2 = [
      [19, 24],
      [20, 25],
      [21, 26],
      [22, 27],
      [23, 28],
      [24, 29],
    ];
    for (var element in list) {
      if (age <= element &&
          list2[list.indexOf(element)][0] <= bmi &&
          list2[list.indexOf(element)][1] >= bmi) {
        return "You are at the ideal weight for your age.";
      }
    }
    return "You are not at the ideal weight for your age.";
  }
}
