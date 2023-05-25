import 'package:carve_app/widgets/calendar_selection.dart';
import 'package:carve_app/widgets/icon_switching.dart';
import 'package:carve_app/widgets/tracker_baby.dart';
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
  TextEditingController _noteController = TextEditingController();

  void _showNotesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Today\'s Notes',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: custom_colors.primaryDarkPurple),
        ),
        content: TextField(
          autofocus: true,
          controller: _noteController,
          cursorColor: custom_colors.secondaryLightPurple,
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: custom_colors.primaryDarkPurple),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: custom_colors.primaryDarkPurple),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.clear,
                  color: custom_colors.secondaryLightPurple,
                ),
                onPressed: () {
                  _noteController.clear();
                },
              ),
              hintText: "Add a note for " +
                  targetDay.day.toString() +
                  "/" +
                  targetDay.month.toString() +
                  '/' +
                  targetDay.year.toString(),
              hintStyle: TextStyle(
                  fontSize: 16,
                  color: custom_colors.primaryDarkPurple.withOpacity(0.5))),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                note = _noteController.text;
                _noteController.clear();
              });
              Navigator.pop(context);
            },
            child: Text(
              'Add',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: custom_colors.secondaryLightPurple),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: custom_colors.backgroundPurple,
          child: Column(
            children: [
              TrackerBabyCard(),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TrackerInfo(
                          "Jan 2024",
                          "Due Date",
                          Icons.pregnant_woman_rounded,
                        ),
                        TrackerInfo(
                          "10/day",
                          "Contractions",
                          Icons.child_friendly,
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    TrackerOptions(
                        "Milestones", "Your important dates", Icons.list),
                    SizedBox(height: 20),
                    TrackerOptions(
                        "Medical History",
                        "Your previous visit/check-up",
                        Icons.medical_information),
                    SizedBox(height: 20),
                    TrackerOptions("My Notes", "Your memories recorded",
                        Icons.my_library_books_outlined),
                    SizedBox(height: 50),
                    GestureDetector(
                      onTap: () => _showNotesDialog(context),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        height: 45,
                        width: 175,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: custom_colors.primaryDarkPurple
                                  .withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            )
                          ],
                          color: custom_colors.secondaryLightPurple,
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Add Notes",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Icon(
                              Icons.add_circle_outlined,
                              color: Colors.white,
                              size: 24,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
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

class TrackerInfo extends StatelessWidget {
  String description;
  String header;
  IconData icon;

  TrackerInfo(
    this.description,
    this.header,
    this.icon,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 80,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: custom_colors.primaryDarkPurple.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(1, 5),
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 40,
            color: custom_colors.secondaryLightPurple,
          ),
          SizedBox(width: 4),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                header,
                style: TextStyle(
                    fontSize: 14,
                    color: custom_colors.primaryDarkPurple.withOpacity(0.4)),
              ),
              Text(
                description,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: custom_colors.primaryDarkPurple),
              ),
            ],
          )
        ],
      ),
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
      padding: EdgeInsets.symmetric(horizontal: 12),
      height: 60,
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
                  style: TextStyle(
                      color: custom_colors.primaryDarkPurple,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Text(
                  description,
                  style: TextStyle(
                      fontSize: 14, color: custom_colors.secondaryLightPurple),
                )
              ],
            ),
          ),
          Spacer(),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.white.withOpacity(0.5)),
            child: Icon(Icons.navigate_next,
                color: custom_colors.primaryDarkPurple, size: 30),
          )
        ],
      ),
    );
  }
}
