import 'package:carve_app/providers/user_provider.dart';
import 'package:carve_app/screens/question_2_if_pregnant.dart';
import 'package:carve_app/widgets/question_progress_bar.dart';
import 'package:carve_app/widgets/question_screen_answer_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/colors.dart' as custom_colors;
import 'question_2_screen.dart';

class Question1Screen extends StatefulWidget {
  static const routeName = '/question-1';

  @override
  State<Question1Screen> createState() => _Question1ScreenState();

  int selectedAnswerIndex = 0;
}

void _updateUserParentType(int selectedIndex, BuildContext context) {
  String userParentType = '';
  switch (selectedIndex) {
    case 1:
      {
        userParentType = "parentType-young-new-parent";
      }
      break;
    case 2:
      {
        userParentType = 'parentType-soon-to-be-parent';
      }
      break;
    case 3:
      {
        userParentType = 'parentType-experienced-parent';
      }
      break;
    case 4:
      {
        userParentType = 'parentType-single-parent';
      }
      break;
    case 5:
      {
        userParentType = 'parentType-pregnant-mother';
      }
      break;
  }

  Provider.of<UserProvider>(context, listen: false)
      .setParentType(userParentType);

  if (selectedIndex == 5) {
    Provider.of<UserProvider>(context, listen: false).setIsPregnant(true);
  }
}

class _Question1ScreenState extends State<Question1Screen> {
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
                    "Let's Start...",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  QuestionProgressBar(1, 6)
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
                        "Which of these groups represent your current parenting stage?",
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
                      child: QuestionScreenAnswerOptions('Young/New Parent',
                          widget.selectedAnswerIndex == 1 ? true : false),
                    ),
                    SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.selectedAnswerIndex = 2;
                        });
                      },
                      child: QuestionScreenAnswerOptions('Soon-to-be Parent',
                          widget.selectedAnswerIndex == 2 ? true : false),
                    ),
                    SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.selectedAnswerIndex = 3;
                        });
                      },
                      child: QuestionScreenAnswerOptions('Experienced Parent',
                          widget.selectedAnswerIndex == 3 ? true : false),
                    ),
                    SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.selectedAnswerIndex = 4;
                        });
                      },
                      child: QuestionScreenAnswerOptions('Single Parent',
                          widget.selectedAnswerIndex == 4 ? true : false),
                    ),
                    SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.selectedAnswerIndex = 5;
                        });
                      },
                      child: QuestionScreenAnswerOptions('Pregnant Mother',
                          widget.selectedAnswerIndex == 5 ? true : false),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: (() {
                        if (widget.selectedAnswerIndex != 0) {
                          widget.selectedAnswerIndex == 5
                              ? Navigator.of(context)
                                  .pushNamed(Question2PregnantScreen.routeName)
                              : Navigator.of(context)
                                  .pushNamed(Question2Screen.routeName);
                          _updateUserParentType(
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
