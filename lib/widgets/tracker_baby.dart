import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;

class TrackerBabyCard extends StatelessWidget {
  const TrackerBabyCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 80, left: 20, right: 20, bottom: 10),
      width: double.infinity,
      height: 500,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xffE5E6FE), Color(0xff8F94FC)]),
          boxShadow: [BoxShadow(blurRadius: 10)],
          color: custom_colors.secondaryLightPurple,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 165,
            width: 165,
            child: CircularProgressIndicator(
              backgroundColor: Colors.white30,
              value: 0.6, // need to change it to be dynamic
              strokeWidth: 10,
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
