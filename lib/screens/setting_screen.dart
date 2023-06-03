import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/setting_widget.dart';
import '../auth.dart';
import '../models/colors.dart' as custom_colors;
import '../providers/user_provider.dart';
import '../screens/question_title_screen.dart';

class SettingScreen extends StatelessWidget {
  static const routeName = '/setting';

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        color: custom_colors.backgroundPurple,
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
            Text(
              'Your Profile',
              style: TextStyle(
                  fontSize: 30,
                  color: custom_colors.primaryDarkPurple,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            SettingWidget(
                Icons.email_outlined, _provider.userProviderData.email, true),
            const SizedBox(height: 20),
            SettingWidget(
                Icons.account_box, _provider.userProviderData.name, true),
            const SizedBox(height: 40),
            Text("Settings",
                style: TextStyle(
                    fontSize: 18,
                    color: custom_colors.primaryDarkPurple.withOpacity(0.5),
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            GestureDetector(
                onTap: () => Navigator.of(context)
                    .pushNamed(QuestionTitleScreen.routeName),
                child: SettingWidget(
                    Icons.replay, 'Redo Onboarding Questions', false)),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => Auth().signOut(context),
              child: SettingWidget(Icons.logout, "Log Out", false),
            ),
          ],
        ),
      ),
    );
  }
}
