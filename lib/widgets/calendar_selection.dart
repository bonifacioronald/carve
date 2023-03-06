import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../models/colors.dart';

class CalendarSelection extends StatefulWidget {
  @override
  State<CalendarSelection> createState() => _CalendarSelectionState();
}

DateTime startOfPregnancy = DateTime(2022, 09, 03);
DateTime inputDate = DateTime.now();
DateTime targetDay = DateTime.now();
Duration? diff;
int? days;
int displayedWeek =
    (DateTime.now().difference(startOfPregnancy).inDays / 7).ceil();
int number = 1;
String imageUrl = '';
CalendarFormat _calendarFormat = CalendarFormat.week;
TextEditingController _input=TextEditingController();
String screenInput='';



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
  print(screenInput);
  print(_input.text);
  return Container(
      width: 117,
      height: 32,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.transparent, borderRadius: BorderRadius.circular(20)),
      child: Text(text));
}

class _CalendarSelectionState extends State<CalendarSelection> {
  @override
  Widget build(BuildContext context) {
    if (displayedWeek <= 4)
      [
        setState(() {
          imageUrl =
              'lib/assets/images/Carve Pregnancy Tracker Assets/pregnancy_tracker_fetus_1month.png';
        })
      ];
    else if (displayedWeek <= 8)
      [
        setState(() {
          imageUrl =
              'lib/assets/images/Carve Pregnancy Tracker Assets/pregnancy_tracker_fetus_2month.png';
        })
      ];
    else if (displayedWeek <= 12)
      [
        setState(() {
          imageUrl =
              'lib/assets/images/Carve Pregnancy Tracker Assets/pregnancy_tracker_fetus_3month.png';
        })
      ];
    else if (displayedWeek <= 16)
      [
        setState(() {
          imageUrl =
              'lib/assets/images/Carve Pregnancy Tracker Assets/pregnancy_tracker_fetus_4month.png';
        })
      ];
    else if (displayedWeek <= 20)
      [
        setState(() {
          imageUrl =
              'lib/assets/images/Carve Pregnancy Tracker Assets/pregnancy_tracker_fetus_5month.png';
        })
      ];
    else if (displayedWeek <= 24)
      [
        setState(() {
          imageUrl =
              'lib/assets/images/Carve Pregnancy Tracker Assets/pregnancy_tracker_fetus_6month.png';
        })
      ];
    else if (displayedWeek <= 28)
      [
        setState(() {
          imageUrl =
              'lib/assets/images/Carve Pregnancy Tracker Assets/pregnancy_tracker_fetus_7month.png';
        })
      ];
    else if (displayedWeek <= 32)
      [
        setState(() {
          imageUrl =
              'lib/assets/images/Carve Pregnancy Tracker Assets/pregnancy_tracker_fetus_8month.png';
        })
      ];
    else if (displayedWeek <= 40)
      [
        setState(() {
          imageUrl =
              'lib/assets/images/Carve Pregnancy Tracker Assets/pregnancy_tracker_fetus_9month.png';
        })
      ];

    return Container(
        height: 650,
        child: Stack(children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height:125),
                Center(
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                        color: secondaryLightPurple, shape: BoxShape.circle),
                    child: Image(
                        image: ResizeImage(
                            AssetImage(
                              imageUrl,
                            ),
                            width: 250,
                            height: 250)),
                  ),
                ),
                SizedBox(height: 15),
                Text("notes: "+_input.text, style:TextStyle(fontSize:16,color:primaryDarkPurple)),
                SizedBox(height:15),
                Text('Week ' + displayedWeek.toString(),
                    style:
                        TextStyle(fontWeight: FontWeight.w900, fontSize: 24)),
              ]
              
              
              ),
          Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
            Container(color:backgroundPurple,child:TableCalendar(
              headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(fontWeight: FontWeight.bold)),
              availableGestures: AvailableGestures.all,
              focusedDay: targetDay,
              firstDay: DateTime.utc(2022, 08, 31),
              lastDay: DateTime.utc(2032, 08, 31),
              selectedDayPredicate: (day) => isSameDay(day, targetDay),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  targetDay = selectedDay;
                  displayedWeek =
                      (targetDay.difference(startOfPregnancy).inDays / 7)
                          .ceil();
                  _calendarFormat = CalendarFormat.week;
                  number = 1;
                });
              },
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
            )),
            SizedBox(height: 10),
            Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      number=1;
                      targetDay=DateTime.now();
                      _calendarFormat=CalendarFormat.week;
                      displayedWeek=(targetDay.difference(startOfPregnancy).inDays / 7)
                          .ceil();
                    });
                  },
                  child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: secondaryLightPurple,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: primaryDarkPurple.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      width: 120,
                      height: 30,
                      child:
                          Text('Back to Today', style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold))),
                )),
            SizedBox(height: 10),
          ]),
        
        Align(
            alignment: Alignment.bottomCenter,
              child: GestureDetector(
            onTap: () {
              showDialog(context: context,
               
               builder: (context) => AlertDialog(
                
                title: Text('Add Note'),
                content: TextField(
                  autofocus: true,
                  controller:_input,
                   decoration : InputDecoration(
                    suffixIcon: IconButton(
                      icon:Icon(Icons.clear),
                      onPressed: (){_input.clear();},
                      

                      ),
                    
                    hintText:"Add note for - "+ targetDay.day.toString()+
                    "/"+targetDay.month.toString()+'/'+
                    targetDay.year.toString())
               
               ),
               actions:[TextButton(onPressed: () { setState(){screenInput= _input.text; } Navigator.pop(context);
               }, child: Text('Submit',style:TextStyle(fontWeight: FontWeight.w900)))]
               )
              );
              
            },
            child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    color: primaryDarkPurple, shape: BoxShape.circle),
                alignment: Alignment.center,
                child: Icon(Icons.add, color: Colors.white)),
          )
        
        )]
        
        
        ));
  }
}
