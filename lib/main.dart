import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './models/colors.dart' as custom_colors;
import 'auth_widget_tree.dart';
import 'navigation.dart';
import 'providers/content_provider.dart';
import 'providers/daily_content_provider.dart';
import 'providers/forum_provider.dart';
import 'providers/forum_reply_provider.dart';
import 'providers/resource_provider.dart';
import 'providers/user_provider.dart';
import 'providers/video_provider.dart';
import 'screens/content_library_story_screen.dart';
import 'screens/create_forum_screen.dart';
import 'screens/daily_content_screen.dart';
import 'screens/forum_all_screen.dart';
import 'screens/forum_detail_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_register_screen.dart';
import 'screens/question_1_screen.dart';
import 'screens/question_2_if_pregnant.dart';
import 'screens/question_2_screen.dart';
import 'screens/question_3_screen.dart';
import 'screens/question_4_screen.dart';
import 'screens/question_5_screen.dart';
import 'screens/question_6_screen.dart';
import 'screens/question_title_screen.dart';
import 'screens/resource_detail_screen.dart';
import 'screens/setting_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
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
        ChangeNotifierProvider.value(
          value: DailyContentProvider(),
        ),
        ChangeNotifierProvider.value(
          value: ForumProvider(),
        ),
        ChangeNotifierProvider.value(
          value: ContentProvider(),
        ),
        ChangeNotifierProvider.value(
          value: VideoProvider(),
        ),
        ChangeNotifierProvider.value(
          value: ResourceProvider(),
        ),
        ChangeNotifierProvider.value(
          value: ForumReplyProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Carve',
        theme: ThemeData(
            fontFamily: 'Livvic',
            hintColor: custom_colors.secondaryLightPurple),
        home: const AuthWidgetTree(),
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          LoginRegisterScreen.routeName: (context) => LoginRegisterScreen(),
          Navigation.routeName: (context) => Navigation(),
          QuestionTitleScreen.routeName: (context) => QuestionTitleScreen(),
          Question1Screen.routeName: (context) => Question1Screen(),
          Question2Screen.routeName: (context) => Question2Screen(),
          Question2PregnantScreen.routeName: (context) =>
              Question2PregnantScreen(),
          Question3Screen.routeName: (context) => Question3Screen(),
          Question4Screen.routeName: (context) => Question4Screen(),
          Question5Screen.routeName: (context) => Question5Screen(),
          Question6Screen.routeName: (context) => Question6Screen(),
          SettingScreen.routeName: (context) => SettingScreen(),
          DailyContentScreen.routeName: (context) => const DailyContentScreen(),
          ForumAllScreen.routeName: (context) => const ForumAllScreen(),
          createForum.routeName: (context) => createForum(),
          ResourceDetailScreen.routeName: (context) => ResourceDetailScreen(),
          ContentLibraryStory.routeName: (context) =>
              const ContentLibraryStory(),
          forumPage.routeName: (context) => const forumPage(),
        },
      ),
    );
  }
}
