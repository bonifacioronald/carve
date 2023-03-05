import 'package:carve_app/widgets/calendar_selection.dart';
import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;
import 'package:table_calendar/table_calendar.dart';

import '../models/colors.dart';


class TrackerScreen extends StatefulWidget {

  @override
  State<TrackerScreen> createState() => _TrackerScreenState();

}
class _TrackerScreenState extends State<TrackerScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.week;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            color:backgroundPurple,
            padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 20,
                top: MediaQuery.of(context).padding.top + 20),
            
                
              child:
              Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                
                children: [
                
                Text("Growth Tracker",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                SizedBox(height: 10),
                CalendarSelection()
              ])
          ));
  }
}
