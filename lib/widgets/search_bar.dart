import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;

class CustomSearchBar extends StatelessWidget {
  String text;
  Color bgColor;
  Color textColor;

  CustomSearchBar(this.text, this.bgColor, this.textColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(12)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                  fontSize: 14,
                  color: textColor.withOpacity(0.5),
                  fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.search,
              color: custom_colors.primaryDarkPurple,
            )
          ],
        ),
      ),
    );
  }
}
