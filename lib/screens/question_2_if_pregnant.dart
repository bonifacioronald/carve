import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../screens/question_4_screen.dart';
import '../widgets/question_progress_bar.dart';
import '../models/colors.dart' as custom_colors;
import '../providers/user_provider.dart';

class Question2PregnantScreen extends StatefulWidget {
  static const routeName = '/question-2-pregnant';

  @override
  State<Question2PregnantScreen> createState() =>
      _Question2PregnantScreenState();

  int selectedAnswerIndex = 0;
  TextEditingController lastPeriodController = TextEditingController();

  TextEditingController dueDateController = TextEditingController();
}

String errorMessage = '';

void _updateUserChildAge(String childAge, BuildContext context) {
  Provider.of<UserProvider>(context, listen: false).setChildAge(childAge);
}

class _Question2PregnantScreenState extends State<Question2PregnantScreen> {
  late int pregnancyWeek;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: (() => FocusScope.of(context).requestFocus(new FocusNode())),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: custom_colors.primaryDarkPurple,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: MediaQuery.of(context).padding.top + 20,
                ),
                height: 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Just A Few More...",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    QuestionProgressBar(3, 6)
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: custom_colors.backgroundPurple,
                      image: const DecorationImage(
                        image: AssetImage(
                            'lib/assets/images/question_screen_bg.png'),
                        fit: BoxFit.fitWidth,
                      ),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        child: Text("When did you last period start?",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: custom_colors.primaryDarkPurple,
                                fontSize: 24,
                                fontWeight: FontWeight.w900)),
                      ),
                      const SizedBox(height: 30),
                      TextField(
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now()
                                    .subtract(const Duration(days: 42 * 7)),
                                lastDate: DateTime.now());

                            if (pickedDate != null) {
                              pregnancyWeek = ((DateTime.now()
                                          .difference(pickedDate)
                                          .inDays
                                          .toInt()) /
                                      7)
                                  .ceil();
                              debugPrint(pregnancyWeek.toString());
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);

                              setState(() {
                                widget.lastPeriodController.text =
                                    formattedDate;
                              });
                            }
                          },
                          readOnly: true,
                          cursorColor: custom_colors.primaryDarkPurple,
                          controller: widget.lastPeriodController,
                          decoration: InputDecoration(
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: custom_colors.primaryDarkPurple,
                                  width: 4.0),
                            ),
                            fillColor: Colors.white,
                            hintText: 'enter last period ...',
                            hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: custom_colors.primaryDarkPurple
                                    .withOpacity(0.2)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          )),
                      const SizedBox(height: 30),
                      Container(
                        height: 40,
                        width: 40,
                        child: Center(
                            child: Text(
                          "or",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: custom_colors.primaryDarkPurple),
                        )),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        child: Text("What is your due date?",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: custom_colors.primaryDarkPurple,
                                fontSize: 24,
                                fontWeight: FontWeight.w900)),
                      ),
                      const SizedBox(height: 30),
                      TextField(
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2101));

                            if (pickedDate != null) {
                              pregnancyWeek = 42 -
                                  ((pickedDate
                                              .difference(DateTime.now())
                                              .inDays
                                              .toInt()) /
                                          7)
                                      .ceil();
                              debugPrint(pregnancyWeek.toString());
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);

                              setState(() {
                                widget.dueDateController.text = formattedDate;
                              });
                            }
                          },
                          keyboardType: TextInputType.number,
                          cursorColor: custom_colors.primaryDarkPurple,
                          controller: widget.dueDateController,
                          decoration: InputDecoration(
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: custom_colors.primaryDarkPurple,
                                  width: 4.0),
                            ),
                            fillColor: Colors.white,
                            hintText: 'enter date ...',
                            hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: custom_colors.primaryDarkPurple
                                    .withOpacity(0.2)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          )),
                      const SizedBox(height: 30),
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            errorMessage,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: custom_colors.primaryDarkPurple),
                          )),
                      const Spacer(),
                      GestureDetector(
                        onTap: (() {
                          if (widget.dueDateController.text.isNotEmpty ||
                              widget.lastPeriodController.text.isNotEmpty) {
                            Navigator.of(context)
                                .pushNamed(Question4Screen.routeName);
                            _updateUserChildAge(
                                pregnancyWeek.toString(), context);
                          } else {
                            setState(() {
                              errorMessage = 'Please Input A Valid Date!';
                            });
                          }
                        }),
                        child: Container(
                          width: 200,
                          height: 50,
                          decoration: BoxDecoration(
                            color: custom_colors.primaryDarkPurple,
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                color: custom_colors.primaryDarkPurple
                                    .withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Next Question',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
