import 'package:flutter/material.dart';
import 'auth.dart';
import 'navigation.dart';
import '../screens/welcome_screen.dart';

class AuthWidgetTree extends StatefulWidget {
  const AuthWidgetTree({super.key});

  @override
  State<AuthWidgetTree> createState() => _AuthWidgetTreeState();
}

class _AuthWidgetTreeState extends State<AuthWidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print('navigation');
          return Navigation();
        } else {
          print('welcome');
          return WelcomeScreen();
        }
      },
    );
  }
}
