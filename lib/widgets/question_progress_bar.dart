import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;

class QuestionProgressBar extends StatelessWidget {
  int currentStage;
  int totalStage;

  QuestionProgressBar(this.currentStage, this.totalStage);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 6,
            color: Colors.white,
          ),
          Container(
            alignment: Alignment.centerLeft,
            width: double.infinity,
            height: 6,
            child: FractionallySizedBox(
              widthFactor: currentStage / totalStage,
              child: Container(
                color: custom_colors.secondaryLightPurple,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
