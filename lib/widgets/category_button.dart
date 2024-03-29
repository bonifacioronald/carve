import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;

class CategoryButton extends StatelessWidget {
  Color buttonColor;
  Color iconColor;
  IconData icon;
  String text;
  CategoryButton(this.buttonColor, this.iconColor, this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 36,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style:
              TextStyle(fontSize: 14, color: custom_colors.primaryDarkPurple),
        )
      ],
    );
  }
}
