// ignore_for_file: empty_constructor_bodies

import 'package:bmi_nathan/constants/constant.dart';
import 'package:bmi_nathan/helpers/bmi_calculator.dart';
import 'package:bmi_nathan/views/bmi_data_screen.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({
    Key? key,
    required this.bmi,
    // required this.bmiCalculator,
  }) : super(key: key);
  final double bmi;
  //final BmiCalculator? bmiCalculator;
//
  //String determineBmiCategory(double bmiValue) {
  //  String category = "";
  //  if (bmiValue < 16.0) {
  //    category = underweightSevere;
  //  } else if (bmiValue < 17) {
  //    category = underweightModerate;
  //  } else if (bmiValue < 18.5) {
  //    category = underweightMild;
  //  } else if (bmiValue < 25) {
  //    category = normal;
  //  } else if (bmiValue < 30) {
  //    category = overweight;
  //  } else if (bmiValue < 35) {
  //    category = obeseI;
  //  } else if (bmiValue < 40) {
  //    category = obeseII;
  //  } else if (bmiValue >= 40) {
  //    category = obeseIII;
  //  }
  //  return category;
  //}
//
  //String getHealRiskDescription(String categoryName) {
  //  String desc = "";
  //  switch (categoryName) {
  //    case underweightSevere:
  //    case underweightModerate:
  //    case underweightMild:
  //      desc = "Possible nutriotional deficiency and osteoporosis ";
  //      break;
  //    case normal:
  //      desc = "Low risk (healthy range).";
  //      break;
  //    case overweight:
  //      desc =
  //          "Moderate risk of developing heart disease, high blood pressure, stroke, diabetes mellitus.";
  //      break;
  //    case obeseI:
  //    case obeseII:
  //    case obeseIII:
  //      desc =
  //          "High risk of developing heart disease, high blood pressure, stroke, diabetes mellitus.";
  //      break;
//
  //    default:
  //  }
  //  return desc;
  //}
//
  @override
  Widget build(BuildContext context) {
    final BmiCalculator bmiCalculator = BmiCalculator.fromBmiValue(bmi);
    //final bmiCategory =
    bmiCalculator.determineBmiCategory();
    //final bmiDesc =
    bmiCalculator.getHealRiskDescription();

    return Scaffold(
        appBar: AppBar(
          title: const Text("Hasil Hitung BMI"),
        ),
        body: Column(
          children: [
            const Expanded(
              child: Center(
                child: Text(
                  "Results",
                  style: TextStyle(
                    fontSize: 59,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: BmiCard(
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 27.5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        bmiCalculator.bmiCategory ?? "",
                        style: const TextStyle(
                          fontSize: 22.5,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 24, 196, 5),
                        ),
                      ),
                      Text(
                        bmi.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 115,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      Text(
                        bmiCalculator.bmiDescription ?? "",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 80,
                color: const Color(0xffEC3C66),
                child: const Center(
                  child: Text(
                    "RECALCULATE",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
