import 'package:carve_app/providers/user_provider.dart';
import 'package:carve_app/widgets/calendar_selection.dart';
import 'package:carve_app/widgets/icon_switching.dart';
import 'package:carve_app/widgets/tracker_baby.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  String notesOrMedicalHistory = 'medicalHistory';

  void _showInputNotesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        elevation: 20,
        backgroundColor: custom_colors.backgroundPurple,
        title: Text(
          'Add New Records',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: custom_colors.primaryDarkPurple),
        ),
        titlePadding: EdgeInsets.all(20),
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        actionsPadding: EdgeInsets.all(20),
        content: Container(
          height: 160,
          child: Column(
            children: [
              StatefulBuilder(
                builder: (context, setState) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (() {
                          setState(() {
                            notesOrMedicalHistory = 'medicalHistory';
                          });
                        }),
                        child: Container(
                          height: 40,
                          width: 120,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2,
                                  color:
                                      notesOrMedicalHistory == 'medicalHistory'
                                          ? custom_colors.secondaryLightPurple
                                          : custom_colors.secondaryLightPurple
                                              .withOpacity(0.4)),
                              color: notesOrMedicalHistory == 'medicalHistory'
                                  ? custom_colors.primaryDarkPurple
                                  : custom_colors.secondaryLightPurple
                                      .withOpacity(0.4),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8))),
                          child: Center(
                            child: Text(
                              'Medical',
                              style: TextStyle(
                                  fontSize: 16,
                                  color:
                                      notesOrMedicalHistory == 'medicalHistory'
                                          ? Colors.white
                                          : Colors.white.withOpacity(0.9),
                                  fontWeight:
                                      notesOrMedicalHistory == 'medicalHistory'
                                          ? FontWeight.w600
                                          : FontWeight.normal),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (() {
                          setState(() {
                            notesOrMedicalHistory = 'notes';
                          });
                        }),
                        child: Container(
                          height: 40,
                          width: 120,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2,
                                  color: notesOrMedicalHistory == 'notes'
                                      ? custom_colors.secondaryLightPurple
                                      : custom_colors.secondaryLightPurple
                                          .withOpacity(0.4)),
                              color: notesOrMedicalHistory == 'notes'
                                  ? custom_colors.primaryDarkPurple
                                  : custom_colors.secondaryLightPurple
                                      .withOpacity(0.4),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  bottomRight: Radius.circular(8))),
                          child: Center(
                            child: Text(
                              'Notes',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: notesOrMedicalHistory == 'notes'
                                      ? Colors.white
                                      : Colors.white.withOpacity(0.9),
                                  fontWeight: notesOrMedicalHistory == 'notes'
                                      ? FontWeight.w600
                                      : FontWeight.normal),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                autofocus: true,
                controller: _noteController,
                cursorColor: custom_colors.secondaryLightPurple,
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: custom_colors.primaryDarkPurple),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: custom_colors.primaryDarkPurple),
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
                    hintText: "Add a record for " +
                        targetDay.day.toString() +
                        "/" +
                        targetDay.month.toString() +
                        '/' +
                        targetDay.year.toString(),
                    hintStyle: TextStyle(
                        fontSize: 16,
                        color:
                            custom_colors.primaryDarkPurple.withOpacity(0.5))),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                //Create e.g. 26/5/2023
                String todayDate =
                    "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";

                //Create 26/5/2023 - Notes
                String finalRecord = "$todayDate - ${_noteController.text}";

                if (notesOrMedicalHistory == 'notes') {
                  Provider.of<UserProvider>(context, listen: false)
                      .userProviderData
                      .notes
                      .add(finalRecord);
                  Provider.of<UserProvider>(context, listen: false).addNewNotes(
                      Provider.of<UserProvider>(context, listen: false)
                          .userProviderData
                          .notes);
                } else if (notesOrMedicalHistory == 'medicalHistory') {
                  Provider.of<UserProvider>(context, listen: false)
                      .userProviderData
                      .medicalHistory
                      .add(finalRecord);
                  Provider.of<UserProvider>(context, listen: false)
                      .addNewMedHis(
                          Provider.of<UserProvider>(context, listen: false)
                              .userProviderData
                              .medicalHistory);
                }

                _noteController.clear();
                Navigator.pop(context);
              });
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

  void _displayDataBottomSheet(
      String title, String description, BuildContext ctx, List<String> data) {
    List<String> dataNewest = data.reversed.toList();
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      context: ctx,
      builder: (_) {
        return Container(
          height: 280,
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: custom_colors.primaryDarkPurple,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                description,
                style: TextStyle(
                  color: custom_colors.secondaryLightPurple,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: data.isEmpty
                    ? Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: custom_colors.secondaryLightPurple
                              .withOpacity(0.15),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'No Record Added',
                            style: TextStyle(
                                color: custom_colors.primaryDarkPurple,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    : Container(
                        width: double.infinity,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: dataNewest.length,
                          itemBuilder: (_, index) {
                            return Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  height: 40,
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 8),
                                  decoration: BoxDecoration(
                                      color: custom_colors.secondaryLightPurple
                                          .withOpacity(0.15),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Text(
                                    dataNewest[index],
                                    style: TextStyle(
                                      color: custom_colors.primaryDarkPurple,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> notesList = Provider.of<UserProvider>(context, listen: false)
        .userProviderData
        .notes;
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
                    GestureDetector(
                      onTap: () => _displayDataBottomSheet(
                          'Medical History',
                          'Your previous visit/check-up',
                          context,
                          Provider.of<UserProvider>(context, listen: false)
                              .userProviderData
                              .medicalHistory),
                      child: TrackerOptions(
                          "Medical History",
                          "Your previous visit/check-up",
                          Icons.medical_information),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => _displayDataBottomSheet(
                          'My Notes',
                          'Your memories recorded',
                          context,
                          Provider.of<UserProvider>(context, listen: false)
                              .userProviderData
                              .notes),
                      child: TrackerOptions(
                          "My Notes",
                          "Your memories recorded",
                          Icons.my_library_books_outlined),
                    ),
                    SizedBox(height: 50),
                    GestureDetector(
                      onTap: () => _showInputNotesDialog(context),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        height: 45,
                        width: 180,
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
                              "Add A Record ",
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
      color: custom_colors.backgroundPurple,
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
