import '../models/milestones_model.dart';
import '../providers/user_provider.dart';
import '../widgets/calendar_selection.dart';
import '../widgets/tracker_baby.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/colors.dart' as custom_colors;
import 'package:table_calendar/table_calendar.dart';

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
        titlePadding: const EdgeInsets.all(20),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        actionsPadding: const EdgeInsets.all(20),
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
                              borderRadius: const BorderRadius.only(
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
                              borderRadius: const BorderRadius.only(
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
              const SizedBox(
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
                  if (_noteController.text.isEmpty == false) {
                    Provider.of<UserProvider>(context, listen: false)
                        .userProviderData
                        .notes
                        .add(finalRecord);
                    Provider.of<UserProvider>(context, listen: false)
                        .addNewNotes(
                            Provider.of<UserProvider>(context, listen: false)
                                .userProviderData
                                .notes);
                  }
                } else if (notesOrMedicalHistory == 'medicalHistory') {
                  if (_noteController.text.isEmpty == false) {
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

  void _displayMilestoneBottomSheet(int trimester, int week, BuildContext ctx) {
    String weekRange = getWeekRange(trimester);
    List<int> uniqueWeek = getUniqueWeek(trimester);
    List<MilestoneModel> milestoneListByTrimester =
        getMilestoneContentByTrimester(trimester);
    List<MilestoneModel> milestoneListByWeek = [];

    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      context: ctx,
      builder: (_) {
        return Container(
          height: 560,
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trimester $trimester ($weekRange)',
                style: TextStyle(
                    color: custom_colors.primaryDarkPurple,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Your important dates',
                style: TextStyle(
                  color: custom_colors.secondaryLightPurple,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Expanded(
                child: Container(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: uniqueWeek.length,
                    itemBuilder: (_, index) {
                      milestoneListByWeek = [];
                      milestoneListByTrimester.forEach(
                        (element) {
                          if (element.week == uniqueWeek[index]) {
                            milestoneListByWeek.add(element);
                          }
                        },
                      );
                      print("week ${uniqueWeek[index]}: $milestoneListByWeek");
                      return Container(
                        height: milestoneListByWeek.length * 20 + 40,
                        decoration: const BoxDecoration(
                            // color: Colors.amber,
                            // border: Border.all(color: Colors.white, width: 2),
                            ),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Week ${uniqueWeek[index]}',
                                  style: TextStyle(
                                      color: custom_colors.primaryDarkPurple
                                          .withOpacity(0.4),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer()
                              ],
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Container(
                              height: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //cirlce
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: (uniqueWeek[index] <=
                                              int.parse(
                                                  Provider.of<UserProvider>(
                                                          context,
                                                          listen: false)
                                                      .userProviderData
                                                      .childAge))
                                          ? custom_colors.secondaryLightPurple
                                          : custom_colors.secondaryLightPurple
                                              .withOpacity(0.2),
                                      boxShadow: [
                                        (uniqueWeek[index] <=
                                                int.parse(
                                                    Provider.of<UserProvider>(
                                                            context,
                                                            listen: false)
                                                        .userProviderData
                                                        .childAge))
                                            ? BoxShadow(
                                                color: custom_colors
                                                    .primaryDarkPurple
                                                    .withOpacity(0.1),
                                                spreadRadius: 1,
                                                blurRadius: 3,
                                                offset: const Offset(0, 2),
                                              )
                                            : const BoxShadow(
                                                color: Colors.transparent,
                                              )
                                      ],
                                    ),
                                  ),

                                  //line
                                  Expanded(
                                    child: Container(
                                      width: 4,
                                      color: custom_colors.secondaryLightPurple
                                          .withOpacity(0.1),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    height:
                                        milestoneListByWeek.length * 20 + 40,
                                    //  color: Colors.red,
                                    child: ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: milestoneListByWeek.length,
                                      itemBuilder: (_, i) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              milestoneListByWeek[i].milestone,
                                              style: TextStyle(
                                                  color: custom_colors
                                                      .primaryDarkPurple,
                                                  fontSize: 14,
                                                  fontWeight:
                                                      milestoneListByWeek[i]
                                                              .isBolded
                                                          ? FontWeight.bold
                                                          : FontWeight.normal),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _displayDataBottomSheet(
      String title, String description, BuildContext ctx, List<String> data) {
    List<String> dataNewest = data.reversed.toList();
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      context: ctx,
      builder: (_) {
        return Container(
          height: 280,
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
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
              const SizedBox(
                height: 4,
              ),
              Text(
                description,
                style: TextStyle(
                  color: custom_colors.secondaryLightPurple,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
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
                          physics: const BouncingScrollPhysics(),
                          itemCount: dataNewest.length,
                          itemBuilder: (_, index) {
                            return Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  height: 40,
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
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
                                const SizedBox(
                                  height: 8,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
              ),
              const SizedBox(
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
    int currentPregnancyWeek = int.parse(
        Provider.of<UserProvider>(context, listen: false)
            .userProviderData
            .childAge);
    int trimester = getTrimesterFromWeek(currentPregnancyWeek);
    int howManyDays = currentPregnancyWeek * 7;
    int remainingday = 7 * (42 - currentPregnancyWeek);
    DateTime date = DateTime.now();
    DateTime firstDate = date.subtract(Duration(days: howManyDays));
    DateTime duedate = date.add(Duration(days: remainingday));
    String formattedFirstDate = DateFormat.yMMM().format(firstDate);
    String formattedDueDate = DateFormat.yMMM().format(duedate);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: custom_colors.backgroundPurple,
          child: Column(
            children: [
              const TrackerBabyCard(),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TrackerInfo(
                          "${formattedFirstDate}",
                          "Conception",
                          Icons.child_friendly,
                        ),
                        TrackerInfo(
                          "${formattedDueDate}",
                          "Due Date",
                          Icons.pregnant_woman_rounded,
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    GestureDetector(
                      onTap: () => _displayMilestoneBottomSheet(
                          trimester, currentPregnancyWeek, context),
                      child: TrackerOptions(
                          "Milestones", "Your important dates", Icons.list),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => _displayDataBottomSheet(
                          'Record of Previous Medical Visit',
                          'Your previous visit/check-up',
                          context,
                          Provider.of<UserProvider>(context, listen: false)
                              .userProviderData
                              .medicalHistory),
                      child: TrackerOptions(
                          "Medical Record",
                          "Your previous visit/check-up",
                          Icons.medical_information),
                    ),
                    const SizedBox(height: 20),
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
                    const SizedBox(height: 50),
                    GestureDetector(
                      onTap: () => _showInputNotesDialog(context),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        height: 45,
                        width: 180,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: custom_colors.primaryDarkPurple
                                  .withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            )
                          ],
                          color: custom_colors.secondaryLightPurple,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              "Add A Record ",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const Icon(
                              Icons.add_circle_outlined,
                              color: Colors.white,
                              size: 24,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
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
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: custom_colors.primaryDarkPurple.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(1, 5),
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
          const SizedBox(width: 4),
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
      padding: const EdgeInsets.symmetric(horizontal: 12),
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
          const SizedBox(width: 20),
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
          const Spacer(),
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
