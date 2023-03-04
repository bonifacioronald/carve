import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../models/colors.dart';

class CalendarSelection extends StatefulWidget {
  @override
  State<CalendarSelection> createState() => _CalendarSelectionState();
}

int number = 1;
DateTime today = DateTime.now();
CalendarFormat _calendarFormat = CalendarFormat.week;
Widget tapped(String text) {
  return Container(
      width: 117,
      height: 32,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: primaryDarkPurple, borderRadius: BorderRadius.circular(20)),
      child: Text(text, style: TextStyle(color: Colors.white)));
}

Widget untapped(String text) {
  return Container(
      width: 117,
      height: 32,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.transparent, borderRadius: BorderRadius.circular(20)),
      child: Text(text));
}
void _onDaySelected(DateTime day, DateTime focusedDay){
  setState(){today=day;}
}

class _CalendarSelectionState extends State<CalendarSelection> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 351,
        child: Column(children: [
          Container(
              width: 351,
              height: 32,
              decoration: BoxDecoration(
                  color: secondaryLightPurple,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(children: [
                if (number == 1) ...[
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          number = 1;
                          _calendarFormat = CalendarFormat.week;
                        });
                      },
                      child: tapped("Week")),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          number = 2;
                          _calendarFormat = CalendarFormat.twoWeeks;
                        });
                      },
                      child: untapped("2 Weeks")),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          number = 3;
                          _calendarFormat = CalendarFormat.month;
                        });
                      },
                      child: untapped("Month")),
                ],
                if (number == 2) ...[
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          number = 1;
                          _calendarFormat = CalendarFormat.week;
                        });
                      },
                      child: untapped("Week")),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          number = 2;
                          _calendarFormat = CalendarFormat.twoWeeks;
                        });
                      },
                      child: tapped("2 Weeks")),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          number = 3;
                          _calendarFormat = CalendarFormat.month;
                        });
                      },
                      child: untapped("Month")),
                ],
                if (number == 3) ...[
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          number = 1;
                          _calendarFormat = CalendarFormat.week;
                        });
                      },
                      child: untapped("Week")),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          number = 2;
                          _calendarFormat = CalendarFormat.twoWeeks;
                        });
                      },
                      child: untapped("2 Weeks")),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          number = 3;
                          _calendarFormat = CalendarFormat.month;
                        });
                      },
                      child: tapped("Month")),
                ]
              ])),
          TableCalendar(
            headerStyle:
                HeaderStyle(formatButtonVisible: false, titleCentered: true),
            availableGestures: AvailableGestures.all,
            focusedDay: today,
            firstDay: DateTime.utc(2022, 08, 31),
            lastDay: DateTime.utc(2032, 08, 31),
            selectedDayPredicate: (day) => isSameDay(day, today),
            onDayLongPressed: (selectedDay, focusedDay) {
              
            },
            onDaySelected:(selectedDay, focusedDay) {
              setState((){today=selectedDay;});
            },
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
          )
        ]));
  }
}
