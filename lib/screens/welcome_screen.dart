import 'package:carve_app/models/colors.dart';
import 'package:carve_app/widgets/welcome_page_view.dart';
import '../models/colors.dart' as custom_colors;
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'login_register_screen.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

int currentPage = 1;

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _controller = PageController();

  _onPageViewChange(int page) {
    print("Current Page: " + page.toString());
    int previousPage = page;
    if (page != 0)
      previousPage--;
    else
      previousPage = 2;
    print("Previous page: $previousPage");
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 40,
            top: MediaQuery.of(context).padding.top + 20),
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context)
                  .pushReplacementNamed(LoginRegisterScreen.routeName),
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(
                  "SKIP",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
                ),
              ),
            ),
            Container(
              height: 550,
              width: double.infinity,
              color: Colors.white,
              child: PageView(
                onPageChanged: _onPageViewChange,
                controller: _controller,
                children: [
                  WelcomePageView(
                    imageUrl:
                        'lib/assets/images/welcome_screen_pregnant_image.png',
                    title: "Personalized Tracker",
                    description:
                        "Monitor your baby's growth, keep track of important milestones, and ensure you never miss an appointment. From conception all the way until after your baby is born",
                  ),
                  WelcomePageView(
                      imageUrl: 'lib/assets/images/onboarding_1_image.png',
                      title: "Parenting Simplified",
                      description:
                          "Learn essential parenting skills in just 10 minutes with our personalized pregnancy-related content"),
                  WelcomePageView(
                    imageUrl: 'lib/assets/images/onboarding_3_image.png',
                    title: "Resources Provided",
                    description:
                        "We offer you access to all the pregnancy resources near you with just one click",
                  ),
                ],
              ),
            ),
            Center(
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                onDotClicked: (index) {
                  _controller.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                  setState(() {
                    currentPage = index;
                  });
                },
                effect: ExpandingDotsEffect(
                    dotHeight: 8,
                    dotWidth: 12,
                    activeDotColor: custom_colors.secondaryLightPurple),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                currentPage == 2
                    ? Navigator.of(context)
                        .pushReplacementNamed(LoginRegisterScreen.routeName)
                    : _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                setState(() {
                  currentPage = currentPage++;
                });
              },
              child: Container(
                width: 200,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: custom_colors.secondaryLightPurple,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color:
                          custom_colors.secondaryLightPurple.withOpacity(0.7),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  currentPage == 2 ? 'Get Started' : 'Next',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
