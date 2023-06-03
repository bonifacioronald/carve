import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;
import '../screens/create_forum_screen.dart';

class CreateButton extends StatefulWidget {
  final String title;
  const CreateButton(this.title);

  @override
  State<CreateButton> createState() => _CreateButtonState();
}

class _CreateButtonState extends State<CreateButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(createForum.routeName),
      child: Container(
        width: 352,
        height: 60,
        decoration: BoxDecoration(
          color: custom_colors.primaryDarkPurple,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            widget.title,
            style: const TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
