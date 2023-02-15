import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;

class CategoryButton extends StatelessWidget {
  Color color;
  IconData icon;
  String text;

  CategoryButton(this.color, this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: custom_colors.primaryDarkPurple.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 36,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          text,
          style:
              TextStyle(fontSize: 14, color: custom_colors.primaryDarkPurple),
        )
      ],
    );
  }
}
