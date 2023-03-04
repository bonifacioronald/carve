import 'package:carve_app/auth.dart';
import 'package:carve_app/models/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../widgets/setting_widget.dart';
import '../widgets/search_bar.dart';

class SettingScreen extends StatelessWidget {
  static const routeName = '/setting';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 20,
                top: MediaQuery.of(context).padding.top + 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.keyboard_arrow_left_sharp, size: 30),
                      Text('Settings',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: primaryDarkPurple)),
                      Icon(Icons.notifications_active, color: primaryDarkPurple)
                    ]),
                SizedBox(height: 30),
                SearchBar(
                    "Search setting...", backgroundPurple, primaryDarkPurple),
                SizedBox(height: 30),
                SettingWidget(Icons.account_box, "My account"),
                SettingWidget(Icons.lock, "Privacy"),
                SettingWidget(Icons.map, "Address"),
                SettingWidget(Icons.notifications_active, "Notification"),
                SettingWidget(Icons.question_mark_rounded, "Need Help?"),
                SettingWidget(
                    Icons.chat_bubble_outline, "Help Improve The App"),
                SizedBox(height: 30),
                Text("Logins",
                    style: TextStyle(
                        fontSize: 16,
                        color: primaryDarkPurple,
                        fontWeight: FontWeight.bold)),
                SettingWidget(Icons.add_box_rounded, "Add account"),
                GestureDetector(
                  onTap: () => Auth().signOut(context),
                  child: SettingWidget(Icons.logout, "Log Out"),
                ),
              ],
            )));
  }
}
