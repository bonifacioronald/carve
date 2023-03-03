import 'dart:ffi';

import 'package:carve_app/auth.dart';
import 'package:carve_app/navigation.dart';
import 'package:carve_app/widgets/question_progress_bar.dart';
import 'package:carve_app/widgets/question_screen_answer_options.dart';
import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;

class Question6Screen extends StatefulWidget {
  static const routeName = '/question-6';

  @override
  State<Question6Screen> createState() => _Question6ScreenState();

  int selectedAnswerIndex = 0;
  TextEditingController nameController = TextEditingController();

  Future<void> setUserName(String name, BuildContext context) async {
    await Auth().setUserName(name);
    Navigator.of(context).pushNamed(Navigation.routeName);
  }
}

class _Question6ScreenState extends State<Question6Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
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
                      "And We Are Done...",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    QuestionProgressBar(6, 6)
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
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("All done! Let's get to know each other better",
                            style: TextStyle(
                                color: custom_colors.primaryDarkPurple,
                                fontSize: 24,
                                fontWeight: FontWeight.w900)),
                        SizedBox(height: 30),
                        SizedBox(
                          height: 32,
                        ),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'How shall we call you?',
                            style: TextStyle(
                                color: custom_colors.primaryDarkPurple,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 8),
                        TextField(
                            cursorColor: custom_colors.primaryDarkPurple,
                            controller: widget.nameController,
                            decoration: InputDecoration(
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: custom_colors.primaryDarkPurple,
                                    width: 4.0),
                              ),
                              fillColor: Colors.white,
                              hintText: 'enter your name..',
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
                        Spacer(),
                        GestureDetector(
                          onTap: (() {
                            widget.setUserName(
                                widget.nameController.text, context);
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
                                  'Start Your Journey',
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
