import 'package:flutter/material.dart';
import 'auth.dart';
import 'screens/login_register_screen.dart';
import 'navigation.dart';

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
          return Navigation();
        } else {
          return LoginRegisterScreen();
        }
      },
    );
  }
}
