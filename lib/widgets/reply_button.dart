import 'package:flutter/material.dart';

class ReplyButton extends StatelessWidget {
  ReplyButton({Key? key}) : super(key: key);

  Color kBorderColor = Color(0XFF02084B).withOpacity(0.2);
  Color kFocusBorderColor = Color(0XFF02084B);
  Color kHintTextColor = Color(0XFF02084B).withOpacity(0.3);
  Color kHintFillColor = Color(0XFF02084B).withOpacity(0.1);
  double kBorderRadius = 12.0;

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
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.send, color: kFocusBorderColor),
          contentPadding: EdgeInsets.only(left: 16, right: 16),
          fillColor: kHintFillColor,
          hintText: "Well, I think...",
          hintStyle: TextStyle(
            color: kHintTextColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kBorderRadius),
            borderSide: BorderSide(color: kBorderColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kFocusBorderColor),
          ),
        ),
      ),
    );
  }
}
