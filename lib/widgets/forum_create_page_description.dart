import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class descriptionForum extends StatefulWidget {
  const descriptionForum({super.key});

  @override
  State<descriptionForum> createState() => _descriptionForumState();
}

class _descriptionForumState extends State<descriptionForum> {
  var _counterText = "";
  final maxLines = 5;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: maxLines * 24.0,
        child: TextField(
          textInputAction: TextInputAction.go,
          // expands: true,
          maxLines: maxLines,
          onChanged: (value) {
            setState(() {
              _counterText = (100 - value.length).toString();
            });
          },
          maxLength: 100,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0XFFFFFFFF),
            hintText: "Description",
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
        ));
  }
}
