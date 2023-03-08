import 'package:carve_app/models/user_model.dart';
import 'package:carve_app/models/video_model.dart';
import 'package:carve_app/providers/user_provider.dart';
import 'package:carve_app/providers/video_provider.dart';
import 'package:carve_app/widgets/custom_app_bar.dart';
import 'package:carve_app/widgets/daily_content_card.dart';
import 'package:carve_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/colors.dart' as custom_colors;
import '../models/colors.dart';
import '../widgets/main_menu_category_section.dart';
import '../widgets/main_menu_video_course_section.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    var _provider = Provider.of<VideoProvider>(context, listen: false);
    if (_provider.loadedVideoList.isEmpty) {
      _provider.fetchVideoId().then(
        (_) {
          print('Successfuly fetched ${_provider.videoIdList.length} ids');
          _provider.fetchAllVideoData().then(
            (_) {
              setState(
                () {
                  _isLoading = false;
                },
              );
            },
          );
        },
      );
    } else {
      setState(() {
        _isLoading = false;
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserModel currentUser =
        Provider.of<UserProvider>(context, listen: false).userProviderData;
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
                        GestureDetector(
                          onTap: (){},
                          child:SearchBar("Ask parenting questions here...", Colors.white,
                            primaryDarkPurple)),
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
