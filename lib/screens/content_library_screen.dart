import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;

class ContentLibararyScreen extends StatelessWidget {
  const ContentLibararyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Text(
          'Content Library Screen',
          style: TextStyle(
              color: custom_colors.primaryDarkPurple,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
