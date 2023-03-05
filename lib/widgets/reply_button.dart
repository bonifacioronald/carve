import 'package:flutter/material.dart';

class replyButton extends StatelessWidget {
  const replyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 348,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0XFF02084B).withOpacity(0.1),
          hintText: "Well, I think...",
          hintStyle: TextStyle(
              color: Color(0XFF02084B).withOpacity(0.3),
              fontSize: 16,
              fontWeight: FontWeight.bold),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  BorderSide(color: Color(0XFF02084B).withOpacity(0.2))),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0XFF02084B))),
        ),
      ),
    );
  }
}
