import 'package:carve_app/models/colors.dart';
import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;

class QuestionScreenAnswerOptions extends StatelessWidget {
  String text;
  bool isSelected;
  bool isAvailable;
  QuestionScreenAnswerOptions(this.isAvailable, this.text, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: isAvailable ? Color(0xFFFFFFFF) : Color(0xFF919191),
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
