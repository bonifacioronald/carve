import 'package:carve_app/providers/user_provider.dart';
import 'package:carve_app/widgets/custom_app_bar.dart';
import 'package:carve_app/widgets/daily_content_card.dart';
import 'package:carve_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/colors.dart' as custom_colors;
import '../models/user.dart';
import '../widgets/main_menu_category_section.dart';
import '../widgets/main_menu_video_course_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    User currentUser =
        Provider.of<UserProvider>(context, listen: false).currentUser;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        color: custom_colors.backgroundPurple,
        child: Column(
          children: [
            CustomAppBar(),
            //First Half Until Content Card
            Container(
              // color: Colors.red,
              height: 364,
              child: Stack(
                children: [
                  Container(
                    height: 320,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                        color: custom_colors.primaryDarkPurple,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(60),
                            bottomRight: Radius.circular(60))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome Back,\n${currentUser.name}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SearchBar("Search for content"),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: DailyContentCard(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              //color: Colors.red,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  MainMenuCategorySection(),
                  SizedBox(
                    height: 30,
                  ),
                  MainMenuVideoCourseSection(),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
