import 'dart:async';

import 'package:flutter/material.dart';

class Trial extends StatefulWidget {
  const Trial({super.key});

  @override
  State<Trial> createState() => TrialState();
}

class TrialState extends State<Trial> {
  void runTimer() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      print("timer has started");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
