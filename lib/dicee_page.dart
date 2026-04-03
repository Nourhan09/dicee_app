import 'dart:math';

import 'package:flutter/material.dart';

class DiceePage extends StatefulWidget {
  const DiceePage({super.key});

  @override
  State<DiceePage> createState() => _DiceePageState();
}

class _DiceePageState extends State<DiceePage> {
  int dice1 = 1;
  int dice2 = 1;
  void rollDice() {
    setState(() {
      dice2 = Random().nextInt(6) + 1;
      dice1 = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        rollDice();
                      },
                      child: Image.asset('assets/images/dice$dice1.png'),
                    ),
                  ),

                  SizedBox(width: 20.0),

                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        rollDice();
                      },
                      child: Image.asset('assets/images/dice$dice2.png'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),

              ButtonTheme(
                child: ElevatedButton(
                  onPressed: () {
                    if (dice1 == dice2) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Congratulations! You rolled double sixes!',
                          ),
                        ),
                      );
                    } else {
                      rollDice();
                    }
                  },
                  child: Text('Roll'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
