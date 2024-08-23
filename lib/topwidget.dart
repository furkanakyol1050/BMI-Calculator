import 'package:flutter/material.dart';

class TopWidgets extends StatefulWidget {
  const TopWidgets({
    super.key,
    required this.length,
    required this.weight,
    required this.onValueChanged2,
  });

  final ValueChanged<String> onValueChanged2;
  final double length;
  final double weight;

  @override
  State<TopWidgets> createState() => _TopWidgetsState();
}

class _TopWidgetsState extends State<TopWidgets> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(45),
            bottomRight: Radius.circular(45),
          ),
          color: Color.fromRGBO(210, 104, 204, 0.8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            LengthWidget(length: widget.length),
            AgeWidget(onValueChanged: (String value) {
              setState(
                () {
                  widget.onValueChanged2(value);
                },
              );
            }),
            WeightWidget(weight: widget.weight),
          ],
        ),
      ),
    );
  }
}

class WeightWidget extends StatelessWidget {
  const WeightWidget({
    super.key,
    required this.weight,
  });

  final double weight;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Weight",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          width: 80,
          height: 50,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(45),
            ),
            color: Colors.white,
          ),
          child: Text(
            weight.toStringAsFixed(0),
            style: const TextStyle(
              color: Color.fromRGBO(210, 104, 204, 0.8),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class AgeWidget extends StatefulWidget {
  const AgeWidget({
    super.key,
    required this.onValueChanged,
  });
  final ValueChanged<String> onValueChanged;

  @override
  State<AgeWidget> createState() => _AgeWidgetState();
}

class _AgeWidgetState extends State<AgeWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Write your age",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          width: 80,
          height: 50,
          margin: const EdgeInsets.only(top: 20),
          child: TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(0),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(45)),
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(45)),
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.center,
            style: const TextStyle(
              color: Color.fromRGBO(210, 104, 204, 0.8),
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
            onChanged: (value) {
              setState(() {
                widget.onValueChanged(value);
              });
            },
          ),
        ),
      ],
    );
  }
}

class LengthWidget extends StatelessWidget {
  const LengthWidget({
    super.key,
    required this.length,
  });

  final double length;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Length",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          width: 80,
          height: 50,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(45),
            ),
            color: Colors.white,
          ),
          child: Text(
            length.toStringAsFixed(0),
            style: const TextStyle(
              color: Color.fromRGBO(210, 104, 204, 0.8),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
