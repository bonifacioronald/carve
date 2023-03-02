import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;

class ForumScreen extends StatelessWidget {
  const ForumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Text(
          'Forum Screen',
          style: TextStyle(
              color: custom_colors.primaryDarkPurple,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
