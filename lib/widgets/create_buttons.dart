
import 'package:carve_app/screens/create_forum_screen.dart';
import 'package:carve_app/screens/daily_content.dart';
import 'package:flutter/material.dart';

class createButton extends StatelessWidget {
  final String title;
  const createButton(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(createForum.routeName),
      child: Container(
        width:352,
        height: 60,
        decoration: BoxDecoration(
          color: Color(0XFF02084B),
          borderRadius: BorderRadius.circular(20),
        ),
      
              
             child:Center(child: Text(title, style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)))
          
        ),
    );
  }
}