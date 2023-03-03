import 'package:carve_app/models/colors.dart';
import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;

class QuestionScreenAnswerOptions extends StatelessWidget {
  String text;
  bool isSelected;
  QuestionScreenAnswerOptions(this.text, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        border: Border.all(
            color: isSelected
                ? custom_colors.primaryDarkPurple
                : Colors.transparent,
            width: 4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
                color: primaryDarkPurple,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          Icon(
            isSelected ? Icons.check_circle_rounded : null,
            color: custom_colors.primaryDarkPurple,
            size: 28,
          )
        ],
      ),
    );
  }
}
