import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;

class ResourcesScreen extends StatelessWidget {
  const ResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: custom_colors.backgroundPurple,
      child: Center(
        child: Text(
          'Resources Screen',
          style: TextStyle(
              color: custom_colors.primaryDarkPurple,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
