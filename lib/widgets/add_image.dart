import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;

class AddImageInputButton extends StatefulWidget {
  final String title;
  final IconData icon;
  final VoidCallback onCLicked;
  const AddImageInputButton(this.title, this.icon, this.onCLicked, {super.key});

  @override
  State<AddImageInputButton> createState() => _AddImageInputButtonState();
}

class _AddImageInputButtonState extends State<AddImageInputButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onCLicked,
      child: Container(
        width: double.infinity,
        height: 84,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                color: custom_colors.secondaryLightPurple,
              ),
              const SizedBox(height: 8),
              Text(
                widget.title,
                style: TextStyle(
                    color: custom_colors.primaryDarkPurple, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
