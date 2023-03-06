import 'package:carve_app/screens/Local_FoodBank_screen.dart';
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
        GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(FoodBank.routeName),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: buttonColor,
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
              color: iconColor,
              size: 36,
            ),
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

class CategoriesButton extends StatelessWidget {
  String text;

  CategoriesButton(this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20, top: 20, right: 20),
          width: 350,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 17, color: custom_colors.primaryDarkPurple),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 85,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFFD9D9D9),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Direction",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0000EE))),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
