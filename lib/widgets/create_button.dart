import 'package:carve_app/screens/create_forum_screen.dart';
import 'package:flutter/material.dart';

class createButton extends StatefulWidget {
  final String title;
  const createButton(this.title);

  @override
  State<createButton> createState() => _createButtonState();
}

class _createButtonState extends State<createButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(createForum.routeName),
      child: Container(
        width: 352,
        height: 60,
        decoration: BoxDecoration(
          color: Color(0XFF02084B),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            widget.title,
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
