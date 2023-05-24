import 'package:carve_app/screens/question_5_screen.dart';
import 'package:carve_app/widgets/question_progress_bar.dart';
import 'package:carve_app/widgets/question_screen_answer_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/colors.dart' as custom_colors;
import '../providers/user_provider.dart';

class Question4Screen extends StatefulWidget {
  static const routeName = '/question-4';

  @override
  State<Question4Screen> createState() => _Question4ScreenState();

  int selectedAnswerIndex = 0;
}

void _updateUserNumberOfTimesPregnant(int selectedIndex, BuildContext context) {
  String pregnantTimes = '';
  switch (selectedIndex) {
    case 1:
      {
        pregnantTimes = "pregnantTimes-1";
      }
      break;
    case 2:
      {
        pregnantTimes = 'pregnantTimes-2';
      }
      break;
    case 3:
      {
        pregnantTimes = 'pregnantTimes-3';
      }
      break;
    case 4:
      {
        pregnantTimes = 'pregnantTimes-4';
      }
      break;
    case 5:
      {
        pregnantTimes = 'pregnantTimes-more-than-4';
      }
      break;
  }

  Provider.of<UserProvider>(context, listen: false)
      .setNumberOfTimesPregnant(pregnantTimes);
}

class _Question4ScreenState extends State<Question4Screen> {
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
                    "Almost There...",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  QuestionProgressBar(4, 6)
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
                    Container(
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      child: Text("How many times have you been pregnant?",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: custom_colors.primaryDarkPurple,
                              fontSize: 24,
                              fontWeight: FontWeight.w900)),
                    ),
                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.selectedAnswerIndex = 1;
                        });
                      },
                      child: QuestionScreenAnswerOptions(
                          true,
                          'First pregnancy',
                          widget.selectedAnswerIndex == 1 ? true : false),
                    ),
                    SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.selectedAnswerIndex = 2;
                        });
                      },
                      child: QuestionScreenAnswerOptions(
                          true,
                          "Second pregnancy",
                          widget.selectedAnswerIndex == 2 ? true : false),
                    ),
                    SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.selectedAnswerIndex = 3;
                        });
                      },
                      child: QuestionScreenAnswerOptions(
                          true,
                          'Third pregnancy',
                          widget.selectedAnswerIndex == 3 ? true : false),
                    ),
                    SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.selectedAnswerIndex = 4;
                        });
                      },
                      child: QuestionScreenAnswerOptions(
                          true,
                          'Fourth pregnancy',
                          widget.selectedAnswerIndex == 4 ? true : false),
                    ),
                    SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.selectedAnswerIndex = 5;
                        });
                      },
                      child: QuestionScreenAnswerOptions(
                          true,
                          'More than four times',
                          widget.selectedAnswerIndex == 5 ? true : false),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: (() {
                        if (widget.selectedAnswerIndex != 0) {
                          Navigator.of(context)
                              .pushNamed(Question5Screen.routeName);
                          _updateUserNumberOfTimesPregnant(
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
