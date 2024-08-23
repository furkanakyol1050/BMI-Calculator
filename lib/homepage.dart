import 'package:flutter/material.dart';
import 'package:vkiapp/buttonwidget.dart';
import 'package:vkiapp/dataclass.dart';
import 'package:vkiapp/topwidget.dart';

class HomePage extends StatefulWidget {
  final String url;

  const HomePage({Key? key, required this.url}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double weight = 70;
  double length = 185;
  Data calculate = Data(0, 0, 0);
  String age = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TopWidgets(
            length: length,
            weight: weight,
            onValueChanged2: (String value) {
              setState(() {
                age = value;
              });
            },
          ),
          Flexible(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RotatedBox(
                  quarterTurns: 3,
                  child: Slider(
                    activeColor: const Color.fromRGBO(210, 104, 204, 0.8),
                    value: length,
                    onChanged: (value) {
                      length = value;
                      setState(() {});
                    },
                    divisions: 60,
                    max: 200,
                    min: 140,
                  ),
                ),
                Expanded(
                  child: Image(
                    image: AssetImage(widget.url),
                    fit: BoxFit.contain,
                  ),
                ),
                RotatedBox(
                  quarterTurns: 3,
                  child: Slider(
                    activeColor: const Color.fromRGBO(210, 104, 204, 0.8),
                    value: weight,
                    onChanged: (value) {
                      weight = value;
                      setState(() {});
                    },
                    divisions: 60,
                    max: 120,
                    min: 60,
                  ),
                ),
              ],
            ),
          ),
          ButtonWidget(
              age: age, calculate: calculate, length: length, weight: weight),
        ],
      ),
    );
  }
}
