import 'dart:ffi';
import 'package:carve_app/screens/setting_screen.dart';

import '../auth.dart';
import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: MediaQuery.of(context).viewPadding.top + 56,
      width: double.infinity,
      alignment: Alignment.bottomCenter,
      color: custom_colors.primaryDarkPurple,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            child: Image.asset(
              'lib/assets/images/app_logo.png',
              fit: BoxFit.cover,
            ),
          ),
          Spacer(),
          Icon(
            Icons.notifications_active_outlined,
            color: Colors.white,
          ),
          SizedBox(
            width: 12,
          ),
          GestureDetector(
            onTap: () =>
                Navigator.of(context).pushNamed(SettingScreen.routeName),
            child: Icon(
              Icons.account_circle_outlined,
              color: Colors.white,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
