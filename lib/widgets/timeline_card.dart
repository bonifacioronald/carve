import 'package:carve_app/models/colors.dart';
import 'package:carve_app/screens/tracker_screen.dart';
import 'package:flutter/material.dart';

import 'calendar_selection.dart';

class timelineCard extends StatelessWidget {
  const timelineCard({super.key});

  @override
  Widget build(BuildContext context) {
    int displayedWeek =
        (DateTime.now().difference(startOfPregnancy).inDays / 7).ceil();

    return GestureDetector(
      // onTap: (() => Navigator.of(context).pushNamed(TrackerScreen.routeName)),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          width: 350,
          height: 80,
          child: Row(
            children: [
              Container(
                  height: 50,
                  width: 50,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: secondaryLightPurple.withOpacity(0.6)),
                  child: Icon(
                    Icons.calendar_month,
                    size: 30.0,
                    color: Colors.white,
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 4, top: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${displayedWeek}th Week of Pregnancy",
                      style: TextStyle(
                          color: primaryDarkPurple,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "What's coming next?",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.25),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              Expanded(child: SizedBox()),
              Icon(
                Icons.arrow_forward_ios,
                size: 32,
                color: primaryDarkPurple.withOpacity(0.6),
              )
            ],
          )),
    );
  }
}
