import 'package:carve_app/navigation.dart';
import 'package:flutter/material.dart';
import './models/colors.dart' as custom_colors;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carve',
      theme: ThemeData(
          fontFamily: 'Livvic',
          accentColor: custom_colors.secondaryLightPurple),
      home: Navigation(),
    );
  }
}
