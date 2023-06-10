import 'package:flutter/material.dart';

import '../components/reusable_card.dart';

class ResultScreen extends StatefulWidget {
  final String bmi;
  final String result;
  final String feedback;

  const ResultScreen({
    super.key,
    required this.bmi,
    required this.result,
    required this.feedback,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Result',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
          ReusableCard(
            color: const Color(0xff1d1e33),
            myChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.result,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                Text(
                  widget.bmi,
                  style: const TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    widget.feedback,
                    style: const TextStyle(fontSize: 17),
                  ),
                )
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink,
              minimumSize: const Size(double.infinity, 50),
            ),
            child: Text('Re-calculate'.toUpperCase()),
          ),
        ],
      ),
    );
  }
}
