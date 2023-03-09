import '../models/colors.dart' as custom_colors;
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  Color buttonColor;
  Color textColor1;
  Color circleColor2;
  Color quantityColor;
  String category;
  int quantity;
  Category(this.buttonColor, this.textColor1, this.circleColor2,
      this.quantityColor, this.category, this.quantity);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        height: 32,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(category,
                  style: TextStyle(
                      color: textColor1,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              SizedBox(width: 4),
              Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: circleColor2),
                  child: Center(
                      child: Text("$quantity",
                          style: TextStyle(
                              color: quantityColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)))),
            ]));
  }
}

class CategoryClick extends StatefulWidget {
  const CategoryClick({super.key});

  @override
  State<CategoryClick> createState() => _CategoryClickState();
}

class _CategoryClickState extends State<CategoryClick> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
