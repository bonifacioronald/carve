import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  Color buttonColor;
  IconData buttonIcon;
  Color iconColor;
  String desc;

  Buttons(this.buttonColor, this.buttonIcon, this.iconColor, this.desc);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: buttonColor,
              ),
              width: 70,
              height: 70,
              child: Center(
                child: Icon(buttonIcon, color: iconColor, size: 40),
              )),
          SizedBox(height: 12),
          Text(desc)
        ],
      )),
    );
  }
}
