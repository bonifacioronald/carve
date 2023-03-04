import 'package:carve_app/widgets/icon_switching_button.dart';
import 'package:carve_app/widgets/toggle_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;
import 'package:intl/intl.dart';

class DailyContent extends StatefulWidget {
  const DailyContent({super.key});
  static const routeName = '/dailyContent-1';

  @override
  State<DailyContent> createState() => _DailyContentState();
}

class _DailyContentState extends State<DailyContent> {
  @override
  Widget build(BuildContext context) {
    imageCache.clear;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd MMMM yyyy').format(now);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: 1430,
          color: custom_colors.backgroundPurple,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 695,
                padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: MediaQuery.of(context).padding.top + 30),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("lib/assets/images/daily_bg.png"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Column(
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 30,
                            width: 150,
                            child: Center(
                              child: Text(
                                "Daily Content",
                                style: TextStyle(
                                    color: custom_colors.primaryDarkPurple,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 170),
                          GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: Icon(
                                Icons.close_sharp,
                                size: 30,
                                color: custom_colors.primaryDarkPurple,
                              ),
                            ),
                          )
                        ]),
                    SizedBox(height: 520),
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
                        IconSwitchingButton(
                            Icons.pause_circle_filled, Icons.play_circle_fill),
                        SizedBox(width: 5),
                        IconSwitchingButton(Icons.volume_up, Icons.volume_off)
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Column(
                  children: [
                    Container(
                        child: Row(children: [
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
                      )
                    ])),
                    SizedBox(height: 20, width: 180),
                    Container(
                      padding: EdgeInsets.only(top: 15, left: 15),
                      height: 90,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: custom_colors.primaryDarkPurple),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Add a note about something you've learnt",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          SizedBox(height: 15, width: 20),
                          Row(
                            children: [
                              Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    color: custom_colors.secondaryLightPurple,
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: Icon(
                                    Icons.note_add_rounded,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                                width: 8,
                              ),
                              Text(
                                "Add a note",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 35),
                    Container(
                        padding: EdgeInsets.only(left: 30),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: custom_colors.primaryDarkPurple,
                                      shape: BoxShape.circle),
                                  child: Icon(Icons.bookmark_add_outlined,
                                      color: Colors.white),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "Save",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 100),
                                Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                        color: custom_colors.primaryDarkPurple,
                                        shape: BoxShape.circle),
                                    child: Icon(
                                      Icons.my_library_books,
                                      color: Colors.white,
                                      size: 20,
                                    )),
                                SizedBox(width: 8),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Mode",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Story",
                                      style: TextStyle(
                                          color: custom_colors
                                              .secondaryLightPurple),
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 30),
                            Row(
                              children: [
                                Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: custom_colors.primaryDarkPurple,
                                      shape: BoxShape.circle),
                                  child: Icon(Icons.download,
                                      size: 20, color: Colors.white),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "Download",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 63),
                                Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                        color: custom_colors.primaryDarkPurple,
                                        shape: BoxShape.circle),
                                    child: Center(
                                      child: Text(
                                        "1.0x",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                    )),
                                SizedBox(width: 8),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Speed",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        )),
                    SizedBox(height: 30),
                    Container(
                      height: 80,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Text(
                            "Story mode autoplay",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: custom_colors.primaryDarkPurple),
                          ),
                          SizedBox(width: 130),
                          ToggleButton(true)
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Text(
                            "Images and videos",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: custom_colors.primaryDarkPurple),
                          ),
                          SizedBox(width: 149),
                          ToggleButton(false)
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Text(
                            "Content attribution",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: custom_colors.primaryDarkPurple),
                          ),
                          SizedBox(width: 155),
                          Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                color: custom_colors.primaryDarkPurple,
                                shape: BoxShape.circle),
                            child: Center(
                              child: Center(
                                child: Icon(
                                  Icons.star_border,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Text(
                            "Report content",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: custom_colors.primaryDarkPurple),
                          ),
                          SizedBox(width: 188),
                          Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                color: custom_colors.primaryDarkPurple,
                                shape: BoxShape.circle),
                            child: Center(
                              child: Center(
                                child: Icon(
                                  Icons.warning_amber_outlined,
                                  size: 21,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Text(
                            "Leave a review",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: custom_colors.primaryDarkPurple),
                          ),
                          SizedBox(width: 190),
                          Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                color: custom_colors.primaryDarkPurple,
                                shape: BoxShape.circle),
                            child: Center(
                              child: Center(
                                child: Icon(
                                  Icons.chat_bubble_outline,
                                  size: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
