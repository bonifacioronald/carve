import 'package:carve_app/widgets/calendar_selection.dart';
import 'package:carve_app/widgets/icon_switching.dart';
import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;
import 'package:table_calendar/table_calendar.dart';

import '../models/colors.dart';

class TrackerScreen extends StatefulWidget {
  static const routeName = '/tracker-screen';
  @override
  State<TrackerScreen> createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  final CalendarFormat _calendarFormat = CalendarFormat.week;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        color: custom_colors.backgroundPurple,
        height: 1000,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 420,
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
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 160,
                        height: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: custom_colors.primaryDarkPurple
                                    .withOpacity(0.2),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: Offset(1, 5),
                              )
                            ]),
                        child: Row(
                          children: [
                            SizedBox(width: 12),
                            Container(
                              height: 45,
                              width: 30,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'lib/assets/images/tracker_pregnant_icon.png'),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 25),
                                Text(
                                  "Due Date",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color:
                                          Color(0xFF02084B).withOpacity(0.3)),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "19 Jan 2024",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w900,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 160,
                        height: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: custom_colors.primaryDarkPurple
                                    .withOpacity(0.2),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: Offset(1, 5),
                              )
                            ]),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: 15),
                            Container(
                              height: 50,
                              width: 25,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'lib/assets/images/tracker_contractions_icon.png'),
                                      fit: BoxFit.fitWidth)),
                            ),
                            SizedBox(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 25),
                                Text(
                                  "Contractions",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color:
                                          Color(0xFF02084B).withOpacity(0.3)),
                                ),
                                SizedBox(height: 5),
                                RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: '10 ',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 18)),
                                      TextSpan(
                                          text: '/day',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 14)),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  TrackerOptions(
                      "My Medical History",
                      "Your previous visit/check-up",
                      Icons.medical_information),
                  SizedBox(height: 20),
                  TrackerOptions(
                      "My Milestones", "Your previous activites", Icons.list),
                  SizedBox(height: 20),
                  TrackerOptions("My Notes", "Your memories recorded",
                      Icons.my_library_books_outlined),
                  SizedBox(height: 50),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    height: 45,
                    width: 175,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color:
                              custom_colors.primaryDarkPurple.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(1, 5),
                        )
                      ],
                      color: custom_colors.secondaryLightPurple,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add Note",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                          weight: 200,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
      // body: SingleChildScrollView(
      //   child: Container(
      //     width: double.infinity,
      //     color: backgroundPurple,
      //     padding: EdgeInsets.only(
      //         left: 20,
      //         right: 20,
      //         bottom: 60,
      //         top: MediaQuery.of(context).padding.top + 20),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       children: [
      //         Text(
      //           "Pregnancy Tracker",
      //           style: TextStyle(
      //             fontWeight: FontWeight.bold,
      //             fontSize: 30,
      //             color:primaryDarkPurple
      //           ),
      //         ),
      //         SizedBox(height: 20),
      //         CalendarSelection()
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}

class TrackerOptions extends StatelessWidget {
  String title;
  String description;
  IconData icon;

  TrackerOptions(this.title, this.description, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: double.infinity,
      //color: Colors.blue,
      child: Row(
        children: [
          Icon(
            icon,
            size: 40,
            color: custom_colors.secondaryLightPurple,
          ),
          SizedBox(width: 20),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  description,
                  style: TextStyle(color: custom_colors.secondaryLightPurple),
                )
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.zero,
            child: Icon(Icons.navigate_next,
                color: custom_colors.primaryDarkPurple, size: 55),
          )
        ],
      ),
    );
  }
}
