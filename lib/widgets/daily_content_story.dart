import 'package:auto_size_text/auto_size_text.dart';
import 'package:carve_app/models/content_model.dart';
import 'package:carve_app/widgets/icon_switching_button.dart';
import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;
import 'package:intl/intl.dart';
import 'package:carve_app/models/content_model.dart';
import 'package:carve_app/data/content_data.dart';

class DailyContentStory extends StatefulWidget {
  const DailyContentStory({super.key});

  @override
  State<DailyContentStory> createState() => _DailyContentStoryState();
}

class _DailyContentStoryState extends State<DailyContentStory> {
  @override
  Widget build(BuildContext context) {
    @required
    int currentIndex = 1;
    @required
    ContentModel content = contentsData[currentIndex];

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd MMMM yyyy').format(now);

    return Container(
        child: Column(children: [
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
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            SizedBox(height: 20),
            content_box(content, false),
            SizedBox(height: 20),
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
      )
    ]));
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
        //color: Colors.amber,
        child: AutoSizeText(
          content.contentDetails,
          style: TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontWeight: isTitleScreen ? FontWeight.w900 : FontWeight.w600),
          minFontSize: 23,
          maxFontSize: 25,
          maxLines: 15,
        ),
      ),
    );
  }
}
