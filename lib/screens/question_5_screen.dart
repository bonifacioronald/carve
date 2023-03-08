import 'package:carve_app/screens/question_6_screen.dart';
import 'package:carve_app/widgets/question_progress_bar.dart';
import 'package:carve_app/widgets/question_screen_answer_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/colors.dart' as custom_colors;
import '../providers/user_provider.dart';

class Question5Screen extends StatefulWidget {
  static const routeName = '/question-5';

  @override
  State<Question5Screen> createState() => _Question5ScreenState();

  int selectedAnswerIndex = 0;
}

void _updateUserAppUsageDuration(int selectedIndex, BuildContext context) {
  String appUsageDuration = '';
  switch (selectedIndex) {
    case 1:
      {
        appUsageDuration = "appUsageDuration-ten-to-fifteen";
      }
      break;
    case 2:
      {
        appUsageDuration = 'appUsageDuration-fifteen-to-thirty';
      }
      break;
    case 3:
      {
        appUsageDuration = 'appUsageDuration-more-than-thirty';
      }
      break;
  }

  Provider.of<UserProvider>(context, listen: false)
      .setAppUsageDuration(appUsageDuration);
}

class _Question5ScreenState extends State<Question5Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: custom_colors.primaryDarkPurple,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: MediaQuery.of(context).padding.top + 20,
              ),
              height: 170,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Last One...",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  QuestionProgressBar(5, 6)
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: custom_colors.backgroundPurple,
                    image: DecorationImage(
                      image: AssetImage(
                          'lib/assets/images/question_screen_bg.png'),
                      fit: BoxFit.fitWidth,
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                        "How much time are you willing to spend in a day to learn about parenting skills?",
                        style: TextStyle(
                            color: custom_colors.primaryDarkPurple,
                            fontSize: 24,
                            fontWeight: FontWeight.w900)),
                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.selectedAnswerIndex = 1;
                        });
                      },
                      child: QuestionScreenAnswerOptions('10 to 15 minutes',
                          widget.selectedAnswerIndex == 1 ? true : false),
                    ),
                    SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.selectedAnswerIndex = 2;
                        });
                      },
                      child: QuestionScreenAnswerOptions('15 to 30 minutes',
                          widget.selectedAnswerIndex == 2 ? true : false),
                    ),
                    SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.selectedAnswerIndex = 3;
                        });
                      },
                      child: QuestionScreenAnswerOptions('More than 30 minutes',
                          widget.selectedAnswerIndex == 3 ? true : false),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: (() {
                        if (widget.selectedAnswerIndex != 0) {
                          Navigator.of(context)
                              .pushNamed(Question6Screen.routeName);
                          _updateUserAppUsageDuration(
                              widget.selectedAnswerIndex, context);
                        }
                      }),
                      child: Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          color: custom_colors.primaryDarkPurple,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              color: custom_colors.primaryDarkPurple
                                  .withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Next Question',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
