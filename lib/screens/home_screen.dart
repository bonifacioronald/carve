import 'package:carve_app/models/user_model.dart';
import 'package:carve_app/models/video_model.dart';
import 'package:carve_app/providers/user_provider.dart';
import 'package:carve_app/providers/video_provider.dart';
import 'package:carve_app/screens/loading_screen.dart';
import 'package:carve_app/widgets/custom_app_bar.dart';
import 'package:carve_app/widgets/daily_content_card.dart';
import 'package:carve_app/widgets/search_bar.dart';
import 'package:carve_app/widgets/timeline_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/colors.dart' as custom_colors;
import '../models/colors.dart';
import '../navigation.dart';
import '../providers/resource_provider.dart';
import '../widgets/main_menu_category_section.dart';
import '../widgets/main_menu_video_course_section.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

BottomNavigationBar get navigationBar {
  return NavigationState.globalKey.currentWidget as BottomNavigationBar;
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    var _userProvider = Provider.of<VideoProvider>(context, listen: false);
    var _resourcesProvider =
        Provider.of<ResourceProvider>(context, listen: false);

    if (_userProvider.loadedVideoList.isEmpty) {
      _userProvider.fetchVideoId().then(
        (_) {
          print('Successfuly fetched ${_userProvider.videoIdList.length} ids');
          _userProvider.fetchAllVideoData().then(
            (value) {
              _resourcesProvider.fetchResourceId().then(
                (_) {
                  print(
                      'Successfuly fetched ${_resourcesProvider.resourceIdList.length} ids');
                  _resourcesProvider.fetchAllResourceData().then(
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
    return _isLoading
        ? LoadingScreen()
        : SingleChildScrollView(
            child: Container(
              width: double.infinity,
              color: custom_colors.backgroundPurple,
              child: Column(
                children: [
                  CustomAppBar(),
                  //First Half Until Content Card
                  Container(
                    //color: Colors.red,
                    height: 364,
                    child: Stack(
                      children: [
                        Container(
                          height: 320,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
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
                                  onTap: () => navigationBar.onTap!(3),
                                  child: CustomSearchBar(
                                      "Ask parenting questions here...",
                                      Colors.white,
                                      primaryDarkPurple)),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Support',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: custom_colors.primaryDarkPurple,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 24),
                        //Put gesture detector here please
                        timelineCard(),
                        MainMenuCategorySection(),
                        SizedBox(
                          height: 20,
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
