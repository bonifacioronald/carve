import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';
import '../providers/user_provider.dart';
import '../models/colors.dart';

class TimelineCard extends StatelessWidget {
  const TimelineCard({super.key});
  String toOrdinal(int number) {
    if (number < 0) throw Exception('Invalid Number');
    if (number >= 11 && number <= 13) {
      return '${number}th';
    }
    ;

    switch (number % 10) {
      case 1:
        return '${number}st';
      case 2:
        return '${number}nd';
      case 3:
        return '${number}rd';
      default:
        return '${number}th';
    }
  }

  @override
  Widget build(BuildContext context) {
    UserModel currentUser =
        Provider.of<UserProvider>(context, listen: false).userProviderData;
    int displayedWeek = int.parse(currentUser.childAge);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: primaryDarkPurple.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 2,
          offset: const Offset(0, 2),
        ),
      ], color: Colors.white, borderRadius: BorderRadius.circular(12)),
      width: 350,
      height: 80,
      child: Row(
        children: [
          Container(
              height: 50,
              width: 50,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: secondaryLightPurple.withOpacity(1)),
              child: const Icon(
                Icons.child_friendly_rounded,
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
                  "${toOrdinal(displayedWeek)} Week of Pregnancy",
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
          const Expanded(child: SizedBox()),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 24,
            color: secondaryLightPurple,
          )
        ],
      ),
    );
  }
}
