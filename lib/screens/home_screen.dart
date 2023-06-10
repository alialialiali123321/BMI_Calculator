import 'package:flutter/material.dart';

import '../components/icon_with_label.dart';
import '../components/reusable_card.dart';
import '../components/rounded_button.dart';
import '../methods/calculate_bmi.dart';
import 'result_screen.dart';

enum GenderSelection {
  male,
  female,
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Color inActiveColor = const Color(0xff1d1e33);
  final Color activeColor = const Color(0x011d1e33);
  GenderSelection? selection;
  int _height = 150;
  int _weight = 65;
  int _age = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CLCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  ReusableCard(
                    color: selection == GenderSelection.male
                        ? activeColor
                        : inActiveColor,
                    myChild: const IconWithLabel(
                      icon: Icons.male,
                      label: 'Male',
                    ),
                    onPressed: () {
                      setState(() {
                        selection = GenderSelection.male;
                      });
                    },
                  ),
                  ReusableCard(
                    color: selection == GenderSelection.female
                        ? activeColor
                        : inActiveColor,
                    myChild: const IconWithLabel(
                      icon: Icons.female,
                      label: 'Feale',
                    ),
                    onPressed: () {
                      setState(() {
                        selection = GenderSelection.female;
                      });
                    },
                  ),
                ],
              ),
            ),
            ReusableCard(
              color: const Color(0xff1d1e33),
              myChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        _height.toString(),
                        style: const TextStyle(
                          fontSize: 47,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Cm',
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: const SliderThemeData(
                      trackHeight: 2,
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xffeb1555),
                      overlayColor: Color(0xAAEB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 13),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    ),
                    child: Slider(
                      max: 220,
                      min: 120,
                      value: _height.toDouble(),
                      onChanged: (value) {
                        setState(() {
                          _height = value.toInt().round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  ReusableCard(
                    color: const Color(0xff1d1e33),
                    myChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Weight'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              _weight.toString(),
                              style: const TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'Kg',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  _weight++;
                                });
                              },
                              color: const Color(0xff0A0E21),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            RoundedButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  _weight--;
                                });
                              },
                              color: const Color(0xff0A0E21),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ReusableCard(
                    color: const Color(0xff1d1e33),
                    myChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Age'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              _age.toString(),
                              style: const TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'Yr',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  _age++;
                                });
                              },
                              color: const Color(0xff0A0E21),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            RoundedButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  _age--;
                                });
                              },
                              color: const Color(0xff0A0E21),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                CalculateBMI calculateBMI =
                    CalculateBMI(height: _height, weight: _weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(
                      bmi: calculateBMI.calcualateBMI(),
                      result: calculateBMI.getResult(),
                      feedback: calculateBMI.feedBack(),
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('CALCULATE'),
            )
          ],
        ),
      ),
    );
  }
}
