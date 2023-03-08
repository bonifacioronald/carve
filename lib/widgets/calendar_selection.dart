import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../models/colors.dart' as custom_colors;

class CalendarSelection extends StatefulWidget {
  @override
  State<CalendarSelection> createState() => _CalendarSelectionState();
}

DateTime startOfPregnancy = DateTime(2022, 09, 03);
DateTime targetDay = DateTime.now();
Duration? diff;
int? days;
int displayedWeek =
    (DateTime.now().difference(startOfPregnancy).inDays / 7).ceil();
int selectedTimePeriod = 1; // 1 = week, 2 = 2 weeks, 3 = month
String imageUrl = '';
CalendarFormat _calendarFormat = CalendarFormat.week;
TextEditingController _noteController = TextEditingController();
String note = '';

Widget selectedTimePeriodContainer(String text) {
  return Container(
    width: 117,
    height: 32,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: custom_colors.secondaryLightPurple,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: custom_colors.secondaryLightPurple.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 2,
          offset: Offset(0, 0),
        ),
      ],
    ),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget unselectedTimePeriodContainer(String text) {
  return Container(
    width: 117,
    height: 32,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      text,
      style: TextStyle(color: custom_colors.primaryDarkPurple, fontSize: 14),
    ),
  );
}

class _CalendarSelectionState extends State<CalendarSelection> {
  void showNotesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Note'),
        content: TextField(
            autofocus: true,
            controller: _noteController,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _noteController.clear();
                  },
                ),
                hintText: "Add note for - " +
                    targetDay.day.toString() +
                    "/" +
                    targetDay.month.toString() +
                    '/' +
                    targetDay.year.toString())),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                note = _noteController.text;
              });

              Navigator.pop(context);
            },
            child: Text(
              'Submit',
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (displayedWeek <= 4) {
      [
        setState(() {
          imageUrl =
              'lib/assets/images/pregnancy_tracker_assets/pregnancy_tracker_fetus_1month.png';
        })
      ];
    } else if (displayedWeek <= 8) {
      [
        setState(() {
          imageUrl =
              'lib/assets/images/pregnancy_tracker_assets/pregnancy_tracker_fetus_2month.png';
        })
      ];
    } else if (displayedWeek <= 12) {
      [
        setState(() {
          imageUrl =
              'lib/assets/images/pregnancy_tracker_assets/pregnancy_tracker_fetus_3month.png';
        })
      ];
    } else if (displayedWeek <= 16) {
      [
        setState(() {
          imageUrl =
              'lib/assets/images/pregnancy_tracker_assets/pregnancy_tracker_fetus_4month.png';
        })
      ];
    } else if (displayedWeek <= 20) {
      [
        setState(() {
          imageUrl =
              'lib/assets/images/pregnancy_tracker_assets/pregnancy_tracker_fetus_5month.png';
        })
      ];
    } else if (displayedWeek <= 24) {
      [
        setState(() {
          imageUrl =
              'lib/assets/images/pregnancy_tracker_assets/pregnancy_tracker_fetus_6month.png';
        })
      ];
    } else if (displayedWeek <= 28) {
      [
        setState(() {
          imageUrl =
              'lib/assets/images/pregnancy_tracker_assets/pregnancy_tracker_fetus_7month.png';
        })
      ];
    } else if (displayedWeek <= 32) {
      [
        setState(() {
          imageUrl =
              'lib/assets/images/pregnancy_tracker_assets/pregnancy_tracker_fetus_8month.png';
        })
      ];
    } else if (displayedWeek <= 40) {
      [
        setState(() {
          imageUrl =
              'lib/assets/images/pregnancy_tracker_assets/pregnancy_tracker_fetus_9month.png';
        })
      ];
    }

    return Column(
      children: [
        Container(
          height: 580,
          // color: Colors.red,
          child: Stack(
            children: [
              //Image + Displayed Week
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: custom_colors.secondaryLightPurple
                                .withOpacity(0.4),
                            spreadRadius: 4,
                            blurRadius: 5,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Image(
                          image: ResizeImage(
                              AssetImage(
                                imageUrl,
                              ),
                              width: 250,
                              height: 250)),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('Week ' + displayedWeek.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 30,
                          color: custom_colors.primaryDarkPurple)),
                ],
              ),

              //Calendar Section
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 32,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        if (selectedTimePeriod == 1) ...[
                          GestureDetector(
                              onTap: () {
                                setState(
                                  () {
                                    selectedTimePeriod = 1;
                                    _calendarFormat = CalendarFormat.week;
                                  },
                                );
                              },
                              child: selectedTimePeriodContainer("Week")),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedTimePeriod = 2;
                                  _calendarFormat = CalendarFormat.twoWeeks;
                                });
                              },
                              child: unselectedTimePeriodContainer("2 Weeks")),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedTimePeriod = 3;
                                  _calendarFormat = CalendarFormat.month;
                                });
                              },
                              child: unselectedTimePeriodContainer("Month")),
                        ],
                        if (selectedTimePeriod == 2) ...[
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedTimePeriod = 1;
                                  _calendarFormat = CalendarFormat.week;
                                });
                              },
                              child: unselectedTimePeriodContainer("Week")),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedTimePeriod = 2;
                                  _calendarFormat = CalendarFormat.twoWeeks;
                                });
                              },
                              child: selectedTimePeriodContainer("2 Weeks")),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedTimePeriod = 3;
                                  _calendarFormat = CalendarFormat.month;
                                });
                              },
                              child: unselectedTimePeriodContainer("Month")),
                        ],
                        if (selectedTimePeriod == 3) ...[
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedTimePeriod = 1;
                                  _calendarFormat = CalendarFormat.week;
                                });
                              },
                              child: unselectedTimePeriodContainer("Week")),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedTimePeriod = 2;
                                  _calendarFormat = CalendarFormat.twoWeeks;
                                });
                              },
                              child: unselectedTimePeriodContainer("2 Weeks")),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedTimePeriod = 3;
                                  _calendarFormat = CalendarFormat.month;
                                });
                              },
                              child: selectedTimePeriodContainer("Month")),
                        ]
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  TableCalendar(
                    daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle: TextStyle(
                            fontSize: 16,
                            color: custom_colors.primaryDarkPurple)),
                    calendarStyle: CalendarStyle(
                      rowDecoration: BoxDecoration(
                        color: custom_colors.backgroundPurple.withOpacity(0.8),
                      ),
                      defaultTextStyle: TextStyle(
                          color: custom_colors.primaryDarkPurple, fontSize: 16),
                      todayTextStyle:
                          TextStyle(color: custom_colors.primaryDarkPurple),
                      todayDecoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          shape: BoxShape.circle),
                      selectedDecoration: BoxDecoration(
                        color: custom_colors.secondaryLightPurple,
                        shape: BoxShape.circle,
                      ),
                    ),
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: custom_colors.primaryDarkPurple,
                          fontSize: 16),
                    ),
                    availableGestures: AvailableGestures.all,
                    focusedDay: targetDay,
                    firstDay: DateTime.utc(2022, 08, 31),
                    lastDay: DateTime.utc(2023, 07, 01),
                    selectedDayPredicate: (day) => isSameDay(day, targetDay),
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(
                        () {
                          targetDay = selectedDay;
                          displayedWeek =
                              (targetDay.difference(startOfPregnancy).inDays /
                                      7)
                                  .ceil();
                          _calendarFormat = CalendarFormat.week;
                          selectedTimePeriod = 1;
                        },
                      );
                    },
                    calendarFormat: _calendarFormat,
                    onFormatChanged: (format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            selectedTimePeriod = 1;
                            targetDay = DateTime.now();
                            _calendarFormat = CalendarFormat.week;
                            displayedWeek =
                                (targetDay.difference(startOfPregnancy).inDays /
                                        7)
                                    .ceil();
                          },
                        );
                      },
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.arrow_left_outlined,
                            ),
                            Text(
                              'Today',
                              style: TextStyle(
                                  color: custom_colors.primaryDarkPurple,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        _noteController.text.isNotEmpty
            ? Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Notes: ${_noteController.text}",
                    style: TextStyle(
                        fontSize: 16, color: custom_colors.primaryDarkPurple),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              )
            : SizedBox(
                height: 20,
              ),
        GestureDetector(
          onTap: () => showNotesDialog(context),
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                color: custom_colors.primaryDarkPurple, shape: BoxShape.circle),
            alignment: Alignment.center,
            child: Icon(Icons.add, color: Colors.white),
          ),
        )
      ],
    );
  }
}
