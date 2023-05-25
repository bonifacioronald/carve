import 'package:carve_app/auth.dart';
import 'package:carve_app/models/colors.dart' as custom_colors;
import 'package:carve_app/providers/user_provider.dart';
import 'package:carve_app/screens/question_title_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/colors.dart';
import '../models/user_model.dart';
import '../widgets/setting_widget.dart';
import '../widgets/search_bar.dart';

class SettingScreen extends StatelessWidget {
  static const routeName = '/setting';

  @override
  Widget build(BuildContext context) {
    UserModel currentUsers =
        Provider.of<UserProvider>(context, listen: false).userProviderData;
    var _provider = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
        body: Container(
            color: custom_colors.backgroundPurple,
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width / 10 + 20,
                        left: 10,
                        right: 10,
                        bottom: 40),
                    width: double.infinity,
                    height: 350,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: custom_colors.primaryDarkPurple
                                .withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 2))
                      ],
                      borderRadius: BorderRadius.circular(30),
                      color:
                          custom_colors.secondaryLightPurple.withOpacity(0.5),
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: (() => Navigator.of(context).pop()),
                              icon: Icon(
                                Icons.keyboard_arrow_left_rounded,
                                size: 50,
                                color: custom_colors.primaryDarkPurple,
                              ),
                            ),
                            Text(
                              "Profile",
                              style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: custom_colors.primaryDarkPurple),
                            )
                          ],
                        ),
                        Spacer(),
                        Icon(
                          Icons.account_circle_outlined,
                          size: 90,
                        ),
                        Text(
                          "${currentUsers.name}",
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Email: ${currentUsers.email}",
                          style: TextStyle(
                              color: custom_colors.primaryDarkPurple,
                              fontSize: 16),
                        )
                      ],
                    )),

                Container(
                  padding: EdgeInsets.only(left: 27, right: 36, top: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Settings",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                          onTap: () => Navigator.of(context)
                              .pushNamed(QuestionTitleScreen.routeName),
                          child: SettingWidget(Icons.replay,
                              'Redo Onboarding Questions', false)),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () => Auth().signOut(context),
                        child: SettingWidget(Icons.logout, "Log Out", false),
                      ),
                    ],
                  ),
                ),

                // Row(
                //   children: [
                //     Padding(padding: EdgeInsets.only(left: 30)),
                //
                //   ],
                // ),

                Spacer(),
                Align(
                    alignment: Alignment.center,
                    child: Text('@ 2023 Carve, All rights reserved',
                        style: TextStyle(color: Colors.black.withOpacity(0.5))))
              ],
            )));
  }
}
