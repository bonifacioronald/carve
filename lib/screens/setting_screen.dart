import 'package:flutter/material.dart';
import '../auth.dart';
import '../models/colors.dart' as custom_colors;

class SettingScreen extends StatelessWidget {
  static const routeName = '/setting';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: custom_colors.backgroundPurple,
        child: Center(
          child: ElevatedButton(
            onPressed: (() => Auth().signOut(context)),
            child: Text('Sign Out'),
          ),
        ),
      ),
    );
  }
}
