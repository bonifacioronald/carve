import 'package:carve_app/providers/user_provider.dart';
import 'package:carve_app/screens/discover_screen.dart';
import 'package:carve_app/screens/forum_home_screen.dart';
import 'package:carve_app/screens/home_screen.dart';
import 'package:carve_app/screens/loading_screen.dart';
import 'package:carve_app/screens/setting_screen.dart';
import 'package:carve_app/screens/tracker_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './models/colors.dart' as custom_colors;

class Navigation extends StatefulWidget {
  static const routeName = '/navigation';
  @override
  State<Navigation> createState() => NavigationState();
}

class NavigationState extends State<Navigation> {
  static GlobalKey<NavigationState> globalKey =
      new GlobalKey<NavigationState>();
  BottomNavigationBar get navigationBar {
    return NavigationState.globalKey.currentWidget as BottomNavigationBar;
  }

  int currentIndex = 0;
  bool _isLoading = true;

  List<Widget> screens = [
    HomeScreen(),
    DiscoverScreen(),
    TrackerScreen(),
    ForumHomeScreen(),
    SettingScreen(),
  ];

  @override
  initState() {
    Provider.of<UserProvider>(context, listen: false).fetchUserData().then(
      (_) {
        setState(
          () {
            _isLoading = false;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double NavBarIconSize = 32;
    return Scaffold(
      backgroundColor: custom_colors.backgroundPurple,
      floatingActionButton: Container(
        height: 64,
        width: 64,
        child: FloatingActionButton(
          backgroundColor: custom_colors.secondaryLightPurple,
          onPressed: () => navigationBar.onTap!(2),
          child: Icon(
            Icons.calendar_month,
            size: NavBarIconSize,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: _isLoading ? LoadingScreen() : screens[currentIndex],
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
          boxShadow: [
            BoxShadow(
              color: custom_colors.secondaryLightPurple.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28), topRight: Radius.circular(28)),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: custom_colors.secondaryLightPurple,
            unselectedItemColor:
                custom_colors.secondaryLightPurple.withOpacity(0.5),
            key: globalKey,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: currentIndex,
            onTap: (int newIndex) {
              setState(() {
                currentIndex = newIndex;
              });
            },
            items: [
              BottomNavigationBarItem(
                  label: '',
                  icon: Icon(
                    Icons.home_rounded,
                    size: NavBarIconSize,
                  )),
              BottomNavigationBarItem(
                  label: '',
                  icon: Icon(
                    Icons.explore,
                    size: NavBarIconSize,
                  )),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.group_outlined,
                  size: 0,
                ),
              ),
              BottomNavigationBarItem(
                  label: '',
                  icon: Icon(
                    Icons.forum_rounded,
                    size: NavBarIconSize,
                  )),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.account_circle_rounded,
                  size: NavBarIconSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
