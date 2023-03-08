import 'package:carve_app/screens/question_4_screen.dart';
import 'package:carve_app/screens/question_5_screen.dart';
import 'package:carve_app/widgets/question_progress_bar.dart';
import 'package:carve_app/widgets/question_screen_answer_options.dart';
import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;
import '../models/colors.dart';

class Question2PregnantScreen extends StatefulWidget {
  static const routeName = '/question-2-pregnant';

  @override
  State<Question2PregnantScreen> createState() =>
      _Question2PregnantScreenState();

  int selectedAnswerIndex = 0;
  TextEditingController ageController = TextEditingController();
}

String errorMessage = '';

class _Question2PregnantScreenState extends State<Question2PregnantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: (() => FocusScope.of(context).requestFocus(new FocusNode())),
        child: Container(
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
                      "Just A Few More...",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    QuestionProgressBar(3, 6)
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
                        child: Text("How many weeks have you been pregnant?",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: custom_colors.primaryDarkPurple,
                                fontSize: 24,
                                fontWeight: FontWeight.w900)),
                      ),
                      SizedBox(height: 30),
                      TextField(
                          keyboardType: TextInputType.number,
                          cursorColor: custom_colors.primaryDarkPurple,
                          controller: widget.ageController,
                          decoration: InputDecoration(
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: custom_colors.primaryDarkPurple,
                                  width: 4.0),
                            ),
                            fillColor: Colors.white,
                            hintText: 'enter week ...',
                            hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: custom_colors.primaryDarkPurple
                                    .withOpacity(0.2)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          )),
                      SizedBox(height: 30),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            errorMessage,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: custom_colors.primaryDarkPurple),
                          )),
                      Spacer(),
                      GestureDetector(
                        onTap: (() {
                          if (widget.ageController.text.isNotEmpty &&
                              int.parse(widget.ageController.text) > 0 &&
                              int.parse(widget.ageController.text) <= 42) {
                            Navigator.of(context)
                                .pushNamed(Question4Screen.routeName);
                          } else {
                            setState(() {
                              errorMessage =
                                  'Please Input A Valid Time Period! (1-42 weeks)';
                            });
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
      ),
    );
  }
}
