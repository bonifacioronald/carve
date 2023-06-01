import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/question_6_screen.dart';
import '../widgets/question_progress_bar.dart';
import '../widgets/question_screen_answer_options.dart';
import '../models/colors.dart' as custom_colors;
import '../providers/user_provider.dart';

class Question5Screen extends StatefulWidget {
  static const routeName = '/question-5';

  @override
  State<Question5Screen> createState() => _Question5ScreenState();

  int selectedAnswerIndex = 0;
}

void _updateUserComplication(int selectedIndex, BuildContext context) {
  String complication = '';
  switch (selectedIndex) {
    case 1:
      {
        complication = "pregnantComplication-no";
      }
      break;
    case 2:
      {
        complication = 'pregnantComplication-yes-complications';
      }
      break;
    case 3:
      {
        complication = 'pregnantComplication-yes-medical-condition';
      }
      break;
    case 4:
      {
        complication = 'pregnantComplication-prefer-not-to-disclose';
      }
  }

  Provider.of<UserProvider>(context, listen: false)
      .setComplication(complication);
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
                  const Text(
                    "Last One...",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  QuestionProgressBar(5, 6)
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: custom_colors.backgroundPurple,
                    image: const DecorationImage(
                      image: AssetImage(
                          'lib/assets/images/question_screen_bg.png'),
                      fit: BoxFit.fitWidth,
                    ),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                        "Are you experiencing any pregnancy complications or medical conditions during this pregnancy?",
                        style: TextStyle(
                            color: custom_colors.primaryDarkPurple,
                            fontSize: 24,
                            fontWeight: FontWeight.w900)),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.selectedAnswerIndex = 1;
                        });
                      },
                      child: QuestionScreenAnswerOptions(
                          true,
                          'No, it has been smooth',
                          widget.selectedAnswerIndex == 1 ? true : false),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.selectedAnswerIndex = 2;
                        });
                      },
                      child: QuestionScreenAnswerOptions(
                          true,
                          'Yes, I have complications',
                          widget.selectedAnswerIndex == 2 ? true : false),
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.selectedAnswerIndex = 3;
                        });
                      },
                      child: QuestionScreenAnswerOptions(
                          true,
                          'Yes, I have a medical condition',
                          widget.selectedAnswerIndex == 3 ? true : false),
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.selectedAnswerIndex = 4;
                        });
                      },
                      child: QuestionScreenAnswerOptions(
                          true,
                          'Prefer not to disclose',
                          widget.selectedAnswerIndex == 4 ? true : false),
                    ),
                    const SizedBox(height: 12),
                    const Spacer(),
                    GestureDetector(
                      onTap: (() {
                        if (widget.selectedAnswerIndex != 0) {
                          Navigator.of(context)
                              .pushNamed(Question6Screen.routeName);
                          _updateUserComplication(
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
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
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
