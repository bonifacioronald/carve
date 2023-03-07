import 'package:carve_app/auth_widget_tree.dart';
import 'package:carve_app/navigation.dart';
import 'package:carve_app/providers/user_provider.dart';
import 'package:carve_app/screens/home_screen.dart';
import 'package:carve_app/screens/create_forum_screen.dart';
import 'package:carve_app/screens/daily_content.dart';
import 'package:carve_app/screens/forum_all.dart';
import 'package:carve_app/screens/local_parenting_class_screen.dart';
import 'package:carve_app/screens/resource_categories_screen.dart';
import 'package:carve_app/screens/setting_screen.dart';
import 'package:carve_app/screens/login_register_screen.dart';
import 'package:carve_app/widgets/map_screen_widgets.dart';
import 'package:provider/provider.dart';
import 'package:carve_app/screens/question_1_screen.dart';
import 'package:carve_app/screens/question_2_screen.dart';
import 'package:carve_app/screens/question_3_screen.dart';
import 'package:carve_app/screens/question_4_screen.dart';
import 'package:carve_app/screens/question_5_screen.dart';
import 'package:carve_app/screens/question_6_screen.dart';
import 'package:carve_app/screens/question_title_screen.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: UserProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Carve',
        theme: ThemeData(
            fontFamily: 'Livvic',
            accentColor: custom_colors.secondaryLightPurple),
        home: FoodBank(),
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          LoginRegisterScreen.routeName: (context) => LoginRegisterScreen(),
          Navigation.routeName: (context) => Navigation(),
          QuestionTitleScreen.routeName: (context) => QuestionTitleScreen(),
          Question1Screen.routeName: (context) => Question1Screen(),
          Question2Screen.routeName: (context) => Question2Screen(),
          Question3Screen.routeName: (context) => Question3Screen(),
          Question4Screen.routeName: (context) => Question4Screen(),
          Question5Screen.routeName: (context) => Question5Screen(),
          Question6Screen.routeName: (context) => Question6Screen(),
          SettingScreen.routeName: (context) => SettingScreen(),
          DailyContent.routeName: (context) => DailyContent(),
          forumAll.routeName: (context) => forumAll(),
          createForum.routeName: (context) => createForum(),
          LocalParentingClass.routeName: (context) => LocalParentingClass(),
          FoodBank.routeName: (context) => FoodBank(),
        },
      ),
    );
  }
}
