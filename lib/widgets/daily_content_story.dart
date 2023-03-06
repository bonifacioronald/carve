import 'package:auto_size_text/auto_size_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carve_app/models/content_model.dart';
import 'package:carve_app/widgets/icon_switching_button.dart';
import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;
import 'package:intl/intl.dart';
import 'package:async/async.dart';

class DailyContentStory extends StatefulWidget {
  List<ContentModel> contentsList;
  DailyContentStory(this.contentsList, {super.key});

  @override
  State<DailyContentStory> createState() => _DailyContentStoryState();
}

int currentSlideIndex = 0;
bool isLastScreen = false;
bool isPaused = false;
bool isPlaying = true;
bool isTitleScreen = false;
RestartableTimer? timer;
int contentIndex = 0;

class _DailyContentStoryState extends State<DailyContentStory> {
  void runTimer() {
    timer = RestartableTimer(const Duration(seconds: 3), () {
      print("timehasstarted");
      setState(() {
        if (timer != null &&
            currentSlideIndex <=
                widget.contentsList[contentIndex].content.length &&
            isPaused == false) {
          currentSlideIndex++;
        }
      });
    });

    if (timer != null &&
        currentSlideIndex <=
            widget.contentsList[contentIndex].content.length - 1) {
      setState(() {
        timer!.reset();
      });
      print("timer resetted");
    }
  }

  @override
  Widget build(BuildContext context) {
    int totalSlides = widget.contentsList[contentIndex].content.length + 1;

    print(widget.contentsList[contentIndex].content.length);
    if (currentSlideIndex <=
        widget.contentsList[contentIndex].content.length - 1) {
      runTimer();
    } else {
      isLastScreen = true;
    }

    if (currentSlideIndex == 0) {
      isTitleScreen = true;
      print(isTitleScreen);
    } else {
      isTitleScreen = false;
    }

    ContentModel content = widget.contentsList[contentIndex];
    String contentTitleScreen = widget.contentsList[contentIndex].content[0];

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
                                content.title,
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
                                currentSlideIndex = 0;
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
                        activeIndex: currentSlideIndex,
                        count: totalSlides,
                        effect: ExpandingDotsEffect(
                          dotColor: Colors.white,
                          activeDotColor: custom_colors.primaryDarkPurple,
                          dotWidth: ((MediaQuery.of(context).size.width - 40) -
                                  ((totalSlides - 1) * (5))) /
                              (totalSlides + 2),
                          dotHeight: 6,
                          spacing: 5,
                          expansionFactor: 3,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    isLastScreen
                        ? ending_box(content)
                        : content_box(content, isTitleScreen),
                    SizedBox(height: isTitleScreen ? 40 : 15),
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
                              if (currentSlideIndex != 0) {
                                setState(() {
                                  currentSlideIndex--;
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
                          flex: 2,
                          child: Container(
                            color: Colors.transparent,
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (currentSlideIndex < totalSlides - 1) {
                                setState(() {
                                  currentSlideIndex++;
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
        alignment: isTitleScreen ? Alignment.bottomLeft : Alignment.centerLeft,
        child: AutoSizeText(
          content.content[currentSlideIndex],
          style: TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontWeight: isTitleScreen ? FontWeight.w900 : FontWeight.w600,
              height: 1.5),
          minFontSize: 23,
          maxFontSize: isTitleScreen ? 40 : 23,
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
                "Excellent work on completing\nyour daily content!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: custom_colors.primaryDarkPurple,
                    height: 1.5),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: custom_colors.primaryDarkPurple),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        content.content[contentIndex],
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
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
