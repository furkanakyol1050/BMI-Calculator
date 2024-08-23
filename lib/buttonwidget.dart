import 'package:flutter/material.dart';
import 'package:vkiapp/dataclass.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.age,
    required this.calculate,
    required this.length,
    required this.weight,
  });

  final String age;
  final Data calculate;
  final double length;
  final double weight;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: TextButton(
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              Color.fromRGBO(210, 104, 204, 0.8),
            ),
          ),
          onPressed: () {
            if (age.isNotEmpty && int.parse(age) >= 18) {
              calculate.age = int.parse(age);
              calculate.length = length;
              calculate.weight = weight;
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(calculate.bmiCalculate()),
                    content: Text(
                        "${calculate.bmiComparison()}\n${calculate.bmiComparisonByAge()}"),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Popup'ı kapat
                        },
                        child: const Text('Close'),
                      ),
                    ],
                  );
                },
              );
            }
          },
          child: const Text(
            "Calculate",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
