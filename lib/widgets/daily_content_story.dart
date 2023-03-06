import 'dart:async';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carve_app/models/content_model.dart';
import 'package:carve_app/navigation.dart';
import 'package:carve_app/screens/home_screen.dart';
import 'package:carve_app/widgets/icon_switching_button.dart';
import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;
import 'package:intl/intl.dart';
import 'package:carve_app/models/content_model.dart';
import 'package:carve_app/data/content_data.dart';
import 'package:async/async.dart';

class DailyContentStory extends StatefulWidget {
  List<ContentModel> contentsList;

  DailyContentStory(this.contentsList);
  @override
  State<DailyContentStory> createState() => _DailyContentStoryState();
}

int currentIndex = 0;
bool isLastScreen = false;
bool isPaused = false;
bool isPlaying = true;

RestartableTimer? timer;

class _DailyContentStoryState extends State<DailyContentStory> {
  void runTimer() {
    timer = RestartableTimer(const Duration(seconds: 30), () {
      print("timehasstarted");
      setState(() {
        if (timer != null &&
            currentIndex < widget.contentsList.length - 1 &&
            isPaused == false) {
          currentIndex++;
        }
      });
    });

    if (timer != null && currentIndex <= widget.contentsList.length - 1) {
      setState(() {
        timer!.reset();
      });
      print("timer resetted");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (currentIndex < widget.contentsList.length - 1) {
      runTimer();
    } else {
      isLastScreen = true;
    }

    ContentModel content = widget.contentsList[currentIndex];
    ContentModel contentTitleScreen = widget.contentsList[0];

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd MMMM yyyy').format(now);

    return Container(
      width: double.infinity,
      height: 695,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 695,
                padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: MediaQuery.of(context).padding.top + 30,
                    bottom: 15),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("lib/assets/images/daily_bg.png"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 30,
                            width: 150,
                            child: Center(
                              child: Text(
                                content.contentTitle,
                                style: TextStyle(
                                    color: custom_colors.primaryDarkPurple,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                              setState(() {
                                currentIndex = 0;
                              });
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: Icon(
                                Icons.close_sharp,
                                size: 20,
                                color: custom_colors.primaryDarkPurple,
                              ),
                            ),
                          )
                        ]),
                    SizedBox(
                      height: 21,
                    ),
                    Container(
                      height: 10,
                      width: MediaQuery.of(context).size.width - 40,
                      child: AnimatedSmoothIndicator(
                        activeIndex: currentIndex,
                        count: widget.contentsList.length,
                        effect: ExpandingDotsEffect(
                          dotColor: Colors.white,
                          activeDotColor: custom_colors.primaryDarkPurple,
                          dotWidth: ((MediaQuery.of(context).size.width - 40) -
                                  ((widget.contentsList.length - 1) * (5))) /
                              (widget.contentsList.length + 2),
                          dotHeight: 6,
                          spacing: 5,
                          expansionFactor: 3,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    isLastScreen
                        ? ending_box(contentTitleScreen)
                        : content_box(content, false),
                    SizedBox(height: content.isTitleScreen ? 40 : 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 30,
                          width: 173,
                          decoration: BoxDecoration(
                              color: custom_colors.primaryDarkPurple,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              formattedDate,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                          ),
                        ),
                        SizedBox(width: 90),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isPaused = !isPaused;
                              print(isPaused);
                              isPlaying = !isPlaying;
                            });
                          },
                          child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  color: custom_colors.primaryDarkPurple,
                                  shape: BoxShape.circle),
                              child: Icon(
                                isPlaying
                                    ? Icons.pause_circle_filled
                                    : Icons.play_circle_fill,
                                color: Colors.white,
                              )),
                        ),
                        SizedBox(width: 5),
                        IconSwitchingButton(Icons.volume_up, Icons.volume_off)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Center(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).padding.top + 70,
                  ),
                  Container(
                    width: double.infinity,
                    height: 540,
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              isLastScreen = false;
                              if (currentIndex != 0) {
                                setState(() {
                                  currentIndex--;
                                  runTimer();
                                });
                              }
                            },
                            child: Container(
                              height: double.infinity,
                              width: double.infinity,
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.transparent,
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (currentIndex <
                                  widget.contentsList.length - 1) {
                                setState(() {
                                  currentIndex++;
                                  runTimer();
                                });
                              }
                            },
                            child: Container(
                              height: double.infinity,
                              width: double.infinity,
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class content_box extends StatelessWidget {
  ContentModel content;
  bool isTitleScreen;

  content_box(this.content, this.isTitleScreen);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment:
            content.isTitleScreen ? Alignment.bottomLeft : Alignment.centerLeft,
        child: AutoSizeText(
          content.contentDetails,
          style: TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontWeight:
                  content.isTitleScreen ? FontWeight.w900 : FontWeight.w600,
              height: 1.5),
          minFontSize: 23,
          maxFontSize: content.isTitleScreen ? 40 : 23,
          maxLines: 13,
        ),
      ),
    );
  }
}

class ending_box extends StatelessWidget {
  ContentModel content;

  ending_box(this.content);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                "Excellent work on completing\n           your daily content!",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: custom_colors.primaryDarkPurple,
                    height: 1.5),
              ),
            ),
            Spacer(),
            Center(
              child: Container(
                width: 300,
                height: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: custom_colors.primaryDarkPurple),
                child: Column(
                  children: [
                    SizedBox(
                      height: 90,
                    ),
                    Container(
                      child: Text(
                        content.contentDetails,
                        style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.w900),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      "Rate this summary",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star_border_outlined,
                          size: 40,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.star_border_outlined,
                          size: 40,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.star_border_outlined,
                          size: 40,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.star_border_outlined,
                          size: 40,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.star_border_outlined,
                          size: 40,
                          color: Colors.white,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
