import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/colors.dart' as custom_colors;

class DescriptionForum extends StatefulWidget {
  final TextEditingController _descriptionController = TextEditingController();
  DescriptionForum(_descriptionController);

  @override
  State<DescriptionForum> createState() => _DescriptionForumState();
}

class _DescriptionForumState extends State<DescriptionForum> {
  var _counterText = "";
  final maxLines = 5;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5 * 24.0,
      child: TextField(
        controller: widget._descriptionController,
        textInputAction: TextInputAction.go,
        // expands: true,
        maxLines: 5,
        onChanged: (value) {
          setState(() {
            _counterText = (100 - value.length).toString();
          });
        },
        maxLength: 100,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0XFFFFFFFF),
          hintText: "Description",
          hintStyle: TextStyle(
              color: custom_colors.primaryDarkPurple.withOpacity(0.3),
              fontSize: 16,
              fontWeight: FontWeight.bold),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: custom_colors.primaryDarkPurple.withOpacity(0.2),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: custom_colors.primaryDarkPurple),
          ),
        ),
      ),
    );
  }
}
