import 'package:carve_app/auth.dart';
import 'package:carve_app/models/colors.dart' as custom_colors;
import 'package:flutter/material.dart';
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
                    GestureDetector(
                      onTap: (() => Navigator.of(context).pop()),
                      child: Icon(Icons.keyboard_arrow_left_sharp, size: 30),
                    ),
                    Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: custom_colors.primaryDarkPurple,
                      ),
                    ),
                    Icon(
                      Icons.notifications_active,
                      color: custom_colors.primaryDarkPurple,
                    )
                  ],
                ),
                SizedBox(height: 20),
                SearchBar("Search setting...", custom_colors.backgroundPurple,
                    custom_colors.primaryDarkPurple),
                SizedBox(height: 40),
                SettingWidget(Icons.account_box, "My account"),
                SettingWidget(Icons.lock, "Privacy"),
                SettingWidget(Icons.map, "Address"),
                SettingWidget(Icons.notifications_active, "Notification"),
                SettingWidget(Icons.question_mark_rounded, "Need Help?"),
                SettingWidget(
                    Icons.chat_bubble_outline, "Help Improve The App"),
                SizedBox(height: 40),
                Text("Logins",
                    style: TextStyle(
                        fontSize: 24,
                        color: custom_colors.primaryDarkPurple,
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
