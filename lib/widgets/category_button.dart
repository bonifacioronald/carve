import 'package:carve_app/screens/resource_detail_screen.dart';
import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;
import 'package:url_launcher/url_launcher.dart';

import '../models/colors.dart';

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
            // boxShadow: [
            //   BoxShadow(
            //     color: custom_colors.primaryDarkPurple.withOpacity(0.2),
            //     spreadRadius: 2,
            //     blurRadius: 2,
            //     offset: Offset(0, 2),
            //   ),
            // ],
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 36,
          ),
        ),
        SizedBox(
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
