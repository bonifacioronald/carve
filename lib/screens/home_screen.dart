import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';
import '../providers/user_provider.dart';
import '../providers/video_provider.dart';
import '../screens/loading_screen.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/daily_content_card.dart';
import '../widgets/search_bar.dart';
import '../widgets/timeline_card.dart';
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
      setState(
        () {
          _isLoading = false;
        },
      );
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
                  const CustomAppBar(),
                  //First Half Until Content Card
                  Container(
                    height: 364,
                    child: Stack(
                      children: [
                        Container(
                          height: 320,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          decoration: BoxDecoration(
                            color: custom_colors.primaryDarkPurple,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(60),
                              bottomRight: Radius.circular(60),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome Back,\n${currentUser.name}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
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
                        const Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: DailyContentCard(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    // color: Colors.red,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 34,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Recommended For You',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: custom_colors.primaryDarkPurple,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                            onTap: () => navigationBar.onTap!(2),
                            child: const TimelineCard()),
                        const SizedBox(height: 24),
                        const MainMenuCategorySection(),
                        const SizedBox(
                          height: 30,
                        ),
                        const MainMenuVideoCourseSection(),
                        const SizedBox(
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
