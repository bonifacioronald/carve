import '../models/colors.dart' as custom_colors;
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  String category;
  int quantity;
  Category(this.category, this.quantity);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      height:32,
      decoration: BoxDecoration(
        color: Color(0XFF02084B),
        borderRadius: BorderRadius.circular(8),
      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(category, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(width: 4),
          Container(
            height:20,
            width: 20,
            decoration: BoxDecoration(
              shape:BoxShape.circle,
              color: Colors.white),
            child: Center(child: Text("$quantity", style: TextStyle(color: custom_colors.primaryDarkPurple, fontSize: 16, fontWeight: FontWeight.bold)))),
        ]
        )

      
    );
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