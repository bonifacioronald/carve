import 'package:carve_app/auth_widget_tree.dart';
import 'package:carve_app/navigation.dart';
import 'package:carve_app/screens/login_register_screen.dart';
import 'package:flutter/material.dart';
import './models/colors.dart' as custom_colors;
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carve',
      theme: ThemeData(
          fontFamily: 'Livvic',
          accentColor: custom_colors.secondaryLightPurple),
      home: AuthWidgetTree(),
    );
  }
}
