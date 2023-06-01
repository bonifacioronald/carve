import '../screens/question_1_screen.dart';
import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;

class QuestionTitleScreen extends StatelessWidget {
  static const routeName = '/question-title-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(
            left: 32,
            right: 32,
            top: MediaQuery.of(context).padding.top + 60,
            bottom: 60),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: custom_colors.secondaryLightPurple,
          image: const DecorationImage(
              image: AssetImage(
                'lib/assets/images/question_screen_bg.png',
              ),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              child: Image.asset(
                'lib/assets/images/app_logo.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Your Personalised Plan Awaits: Answer A Few Questions to Begin',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: custom_colors.primaryDarkPurple),
            ),
            const Spacer(),
            GestureDetector(
              onTap: (() =>
                  Navigator.of(context).pushNamed(Question1Screen.routeName)),
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: custom_colors.primaryDarkPurple,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: custom_colors.primaryDarkPurple.withOpacity(0.3),
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
                      'Get Started',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(
                      Icons.keyboard_arrow_right_rounded,
                      size: 32,
                      color: Colors.white,
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
