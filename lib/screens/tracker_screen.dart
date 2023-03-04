import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;
import 'package:table_calendar/table_calendar.dart';

import '../models/colors.dart';
import '../widgets/calendar_selection.dart';
import '../widgets/calendar_selection.dart';

class TrackerScreen extends StatefulWidget {
  const TrackerScreen({super.key});

  @override
  State<TrackerScreen> createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  DateTime today = DateTime.now();
  
  CalendarFormat _calendarFormat=CalendarFormat.week;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      body: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 20,
                top: MediaQuery.of(context).padding.top + 20),
            child:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CalendarSelection(),



            ]
            )
          )
        );
  }
}