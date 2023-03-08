import 'package:auto_size_text/auto_size_text.dart';
import 'package:carve_app/widgets/toggle_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carve_app/models/content_model.dart';
import 'package:carve_app/widgets/icon_switching_button.dart';
import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;
import 'package:intl/intl.dart';
import 'package:async/async.dart';
import 'package:translator/translator.dart';

class DailyContentStory extends StatefulWidget {
  ContentModel content;
  DailyContentStory(this.content, {super.key});

  @override
  State<DailyContentStory> createState() => _DailyContentStoryState();
}

int currentSlideIndex = 0;
bool isPaused = true;
bool isPlaying = false;
bool isTitleScreen = false;
bool isEnglish = true;
RestartableTimer? timer;

class _DailyContentStoryState extends State<DailyContentStory> {
  String translatedDateToChinese = 'loading...';
  void runTimer() {
    if (timer != null && currentSlideIndex <= widget.content.content.length) {
      setState(() {
        timer!.reset();
      });
      print("timer resetted");
    }
    timer = RestartableTimer(const Duration(seconds: 30), () {
      print("timehasstarted");
      setState(() {
        if (timer != null &&
            currentSlideIndex < widget.content.content.length + 1 &&
            isPaused == false) {
          currentSlideIndex++;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd MMMM yyyy').format(now);

    Future<void> translateDate(String input) async {
      final translator = GoogleTranslator();
      try {
        await translator
            .translate(input, from: 'en', to: 'zh-cn')
            .then((value) {
          setState(() {
            translatedDateToChinese = value.toString();
          });
        });
      } catch (e) {
        throw (e);
      }
    }

    translateDate(formattedDate);
    bool isLastScreen = false;

    int totalSlides = widget.content.content.length + 2;
    print(currentSlideIndex);

    print(widget.content.content.length);
    if (currentSlideIndex < widget.content.content.length + 1) {
      runTimer();
    } else {
      isLastScreen = true;
    }

    if (currentSlideIndex == 0) {
      isTitleScreen = true;
    } else {
      isTitleScreen = false;
    }

    ContentModel content = widget.content;

    return Container(
      child: Column(
        children: [
          Container(
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
                              image:
                                  AssetImage("lib/assets/images/daily_bg.png"),
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
                                      isEnglish ? "Daily Content" : "日常内容",
                                      style: TextStyle(
                                          color:
                                              custom_colors.primaryDarkPurple,
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
                                        color: Colors.white,
                                        shape: BoxShape.circle),
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
                                dotWidth:
                                    ((MediaQuery.of(context).size.width - 40) -
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
                              ? ending_box(content.title)
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
                                    isEnglish
                                        ? formattedDate
                                        : translatedDateToChinese,
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
                              IconSwitchingButton(
                                  Icons.volume_up, Icons.volume_off)
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
                                    if (currentSlideIndex <= totalSlides - 2) {
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
          ),
          Container(
            width: double.infinity,
            height: 80,
            child: Row(
              children: [
                Container(
                    padding: EdgeInsets.only(left: 30, right: 30, top: 10),
                    child: Row(children: [
                      Container(
                        child: Text(
                          "EN",
                          style: TextStyle(
                              color: custom_colors.primaryDarkPurple,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      SizedBox(width: 5),
                      CupertinoSwitch(
                          activeColor: custom_colors.secondaryLightPurple,
                          value: !isEnglish,
                          onChanged: (_) {
                            setState(() {
                              isEnglish = !isEnglish;
                            });
                          }),
                      SizedBox(width: 5),
                      Container(
                        child: Text(
                          "CN",
                          style: TextStyle(
                              color: custom_colors.primaryDarkPurple,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      SizedBox(width: 135),
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: custom_colors.primaryDarkPurple),
                        child: Center(
                          child: Icon(
                            Icons.ios_share,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Share",
                        style: TextStyle(
                            color: custom_colors.primaryDarkPurple,
                            fontWeight: FontWeight.bold),
                      ),
                    ])),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// Future<String> translateToChinese(String input) async {
//   final translator = GoogleTranslator();

//   var translation =
//       await translator.translate(input, from: 'en', to: 'cn').then((value) {setState});

//   return translation.toString();
// }

class content_box extends StatefulWidget {
  ContentModel content;
  bool isTitleScreen;

  content_box(this.content, this.isTitleScreen);

  @override
  State<content_box> createState() => _content_boxState();
}

class _content_boxState extends State<content_box> {
  String translatedTitleToChinese = 'loading...';
  String translatedContentToChinese = 'loading...';

  Future<void> translateTitle(String input) async {
    final translator = GoogleTranslator();
    try {
      await translator.translate(input, from: 'en', to: 'zh-cn').then((value) {
        setState(() {
          translatedTitleToChinese = value.toString();
        });
      });
    } catch (e) {
      throw (e);
    }
  }

  Future<void> translateContent(String input) async {
    final translator = GoogleTranslator();
    try {
      await translator.translate(input, from: 'en', to: 'zh-cn').then((value) {
        setState(() {
          translatedContentToChinese = value.toString();
        });
      });
    } catch (e) {
      throw (e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final translator = GoogleTranslator();
    translateTitle(widget.content.title);
    isTitleScreen
        ? null
        : translateContent(widget.content.content[currentSlideIndex - 1]);
    return Expanded(
      child: Container(
        alignment:
            widget.isTitleScreen ? Alignment.bottomLeft : Alignment.centerLeft,
        child: AutoSizeText(
          widget.isTitleScreen
              ? isEnglish
                  ? widget.content.title
                  : translatedTitleToChinese
              : isEnglish
                  ? widget.content.content[currentSlideIndex - 1]
                  : translatedContentToChinese,
          style: TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontWeight:
                  widget.isTitleScreen ? FontWeight.w900 : FontWeight.w600,
              height: 1.5),
          minFontSize: 23,
          maxFontSize: widget.isTitleScreen ? 40 : 23,
          maxLines: 13,
        ),
      ),
    );
  }
}

class ending_box extends StatefulWidget {
  String title;

  ending_box(this.title);

  @override
  State<ending_box> createState() => _ending_boxState();
}

class _ending_boxState extends State<ending_box> {
  String translatedTitleToChinese = 'loading...';

  Future<void> translateTitle(String input) async {
    final translator = GoogleTranslator();
    try {
      await translator.translate(input, from: 'en', to: 'zh-cn').then((value) {
        setState(() {
          translatedTitleToChinese = value.toString();
        });
      });
    } catch (e) {
      throw (e);
    }
  }

  @override
  Widget build(BuildContext context) {
    translateTitle(widget.title);
    return Expanded(
      child: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                isEnglish
                    ? "Excellent work on completing\nyour daily content!"
                    : '恭喜您完成你的日常内容',
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
                        isEnglish ? widget.title : translatedTitleToChinese,
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
                      isEnglish ? "Rate this summary" : '评价这个概括',
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
