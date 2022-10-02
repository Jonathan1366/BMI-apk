import 'package:bmi_nathan/constants/constant.dart';
import 'package:bmi_nathan/helpers/bmi_calculator.dart';
import 'package:bmi_nathan/views/bmi_result_screen.dart';
import 'package:flutter/material.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({super.key});

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  int height = 100;
  int weight = 50;
  int age = 10;
  String? gender;
  /*double calculateBmi() {
    double heightInMeter = height / 100;
    final h = (heightInMeter * heightInMeter);
    final bmi = weight / h;
    return bmi;
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0A0E21),
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ), //APPBAR
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      gender = "MALE";
                      setState(() {});
                      (gender);
                    },
                    child: BmiCard(
                      borderColor:
                          (gender == "MALE") ? Colors.white : primaryColor,
                      child: const GenderIconText(
                        icon: Icons.male,
                        title: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            gender = "FEMALE";
                            setState(() {});
                          },
                          child: BmiCard(
                            borderColor: (gender == "FEMALE")
                                ? Colors.white
                                : primaryColor,
                            child: const GenderIconText(
                              icon: Icons.female,
                              title: "FEMALE",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BmiCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("HEIGHT",
                      style: labelTextStyle?.copyWith(
                          fontSize: 20.5, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        " $height ",
                        style: numberTextStyle,
                      ),
                      Text(
                        "cm",
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 80,
                    max: 200,
                    thumbColor: const Color.fromARGB(255, 255, 52, 38),
                    inactiveColor: const Color.fromARGB(255, 50, 66, 186),
                    activeColor: const Color.fromARGB(255, 255, 241, 241),
                    onChanged: (value) {
                      height = value.toInt();
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BmiCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: labelTextStyle,
                        ),
                        Text(
                          "$weight",
                          style: numberTextStyle,
                        ),
                        const SizedBox(height: 9),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              onPressed: () {
                                weight += 1;
                                setState(() {});
                              },
                              elevation: 0,
                              shape: const CircleBorder(),
                              fillColor: const Color(0xff212747),
                              constraints: const BoxConstraints.tightFor(
                                width: 79,
                                height: 79,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 11.5,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                weight -= 1;
                                setState(() {});
                              },
                              elevation: 0,
                              shape: const CircleBorder(),
                              fillColor: const Color(0xff212747),
                              constraints: const BoxConstraints.tightFor(
                                width: 79,
                                height: 79,
                              ),
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: BmiCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: labelTextStyle,
                        ),
                        Text(
                          "$age",
                          style: numberTextStyle,
                        ),
                        const SizedBox(height: 9),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              onPressed: () {
                                age += 1;
                                setState(() {});
                              },
                              elevation: 0,
                              shape: const CircleBorder(),
                              fillColor: const Color(0xff212747),
                              constraints: const BoxConstraints.tightFor(
                                width: 79,
                                height: 79,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 11.5,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                age -= 1;
                                setState(() {});
                              },
                              elevation: 0,
                              shape: const CircleBorder(),
                              fillColor: const Color(0xff212747),
                              constraints: const BoxConstraints.tightFor(
                                width: 79,
                                height: 79,
                              ),
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              //(calculateBmi);

              final bmiCalculator =
                  BmiCalculator(height: height, weight: weight);
              bmiCalculator.calculateBmi();

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) {
                    return BmiResultScreen(
                      bmi: bmiCalculator.bmi!,
                    );
                  }),
                ),
              );
            },
            child: Container(
              height: 80,
              color: const Color(0xffEC3C66),
              child: const Center(
                child: Text(
                  "CALCULATE BMI",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
    this.borderColor = primaryColor,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: const Color(0xff272a4e),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: borderColor!),
        ),
        margin: const EdgeInsets.all(15),
        child: child);
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 85,
          color: Colors.white,
        ),
        const SizedBox(
          height: (20),
        ),
        Text(
          title,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
