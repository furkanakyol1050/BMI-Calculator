import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:vkiapp/homepage.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List list = ["assets/man.png", "assets/woman.png"];
  int variable = 0;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: screenSize.height * 0.5,
              width: screenSize.width,
              child: Image(image: AssetImage(list[variable])),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 85, bottom: 50),
              child: ToggleSwitch(
                borderColor: const [
                  Color.fromRGBO(210, 104, 204, 0.8),
                ],
                minWidth: screenSize.width / 2,
                initialLabelIndex: variable,
                cornerRadius: 20.0,
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.white,
                inactiveFgColor: const Color.fromRGBO(210, 104, 204, 0.8),
                totalSwitches: 2,
                labels: const ['Male', 'Female'],
                icons: const [Bootstrap.gender_male, Bootstrap.gender_female],
                activeBgColors: [
                  [Colors.blue.shade400],
                  [Colors.pink.shade400]
                ],
                onToggle: (index) {
                  setState(() {
                    variable = index!;
                  });
                },
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage(url: list[variable])));
              },
              style: const ButtonStyle(
                fixedSize: MaterialStatePropertyAll(Size(200, 50)),
                backgroundColor: MaterialStatePropertyAll(
                  Color.fromRGBO(210, 104, 204, 0.8),
                ),
              ),
              child: const Text(
                "Confirm",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
