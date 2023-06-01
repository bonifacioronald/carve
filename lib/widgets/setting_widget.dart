import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;

class SettingWidget extends StatelessWidget {
  IconData icon;
  String text;
  bool isProfile;

  SettingWidget(this.icon, this.text, this.isProfile);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: isProfile
            ? [
                BoxShadow(
                  color: custom_colors.primaryDarkPurple.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: custom_colors.primaryDarkPurple,
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            text,
            style: TextStyle(
                color: custom_colors.primaryDarkPurple,
                fontSize: 16,
                fontWeight: isProfile ? FontWeight.bold : FontWeight.w400),
          ),
          const Spacer(),
          Icon(
            isProfile ? null : Icons.keyboard_arrow_right_sharp,
            color: custom_colors.primaryDarkPurple,
          )
        ],
      ),
    );
  }
}
