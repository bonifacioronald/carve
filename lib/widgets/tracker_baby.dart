import 'package:carve_app/models/user_model.dart';
import 'package:carve_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/colors.dart' as custom_colors;

class TrackerBabyCard extends StatelessWidget {
  const TrackerBabyCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool currentFirstTrimester = false;
    bool currentSecondTrimester = false;
    bool currentThirdTrimester = false;

    void calculateTrimester(int week) {
      if (week <= 12) {
        currentFirstTrimester = true;
      } else if (week > 12 && week <= 26) {
        currentSecondTrimester = true;
      } else {
        currentThirdTrimester = true;
      }
    }

    UserModel currentUser =
        Provider.of<UserProvider>(context, listen: false).userProviderData;
    int pregnantWeeks = int.parse(currentUser.childAge);
    calculateTrimester(pregnantWeeks);

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
              value: pregnantWeeks / 42,
              strokeWidth: 10,
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Trimesters",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: custom_colors.primaryDarkPurple),
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 32,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Row(children: [
              TrimesterSelection("First", currentFirstTrimester),
              TrimesterSelection("Second", currentSecondTrimester),
              TrimesterSelection("Third", currentThirdTrimester),
            ]),
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.amber,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [],
            ),
          )
        ],
      ),
    );
  }
}

class TrimesterSelection extends StatelessWidget {
  String title;
  bool currentTrimester;

  TrimesterSelection(this.title, this.currentTrimester);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: currentTrimester ? 110 : 120,
      height: 32,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: currentTrimester
            ? custom_colors.secondaryLightPurple
            : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color:
              currentTrimester ? Colors.white : custom_colors.primaryDarkPurple,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
