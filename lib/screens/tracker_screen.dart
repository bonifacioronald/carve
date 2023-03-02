import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;

class TrackerScreen extends StatelessWidget {
  const TrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Text(
          'Tracker Screen',
          style: TextStyle(
              color: custom_colors.primaryDarkPurple,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
