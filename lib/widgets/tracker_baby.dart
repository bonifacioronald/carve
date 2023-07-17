import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/colors.dart' as custom_colors;
import '../models/user_model.dart';
import '../providers/user_provider.dart';

class TrackerBabyCard extends StatefulWidget {
  const TrackerBabyCard({
    super.key,
  });

  @override
  State<TrackerBabyCard> createState() => _TrackerBabyCardState();
}

class _TrackerBabyCardState extends State<TrackerBabyCard> {
  bool currentFirstTrimester = false;
  bool currentSecondTrimester = false;
  bool currentThirdTrimester = false;
  bool calculatedTrimester = false;
  bool loadedBabyImage = false;
  List<Container> exampleList = [];
  String imageUrl = ' ';
  int babyListIndex = 0;

  void calculateTrimester(int week) {
    if (selectedWeeks == 1) {
      babyListIndex = 0;
    } else if (selectedWeeks == 2) {
      babyListIndex = 1;
    } else if (selectedWeeks > 2 && selectedWeeks <= 4) {
      babyListIndex = 2;
    } else if (selectedWeeks > 4 && selectedWeeks <= 8) {
      babyListIndex = 3;
    } else if (selectedWeeks > 8 && selectedWeeks <= 12) {
      babyListIndex = 4;
    } else if (selectedWeeks > 12 && selectedWeeks <= 16) {
      babyListIndex = 5;
    } else if (selectedWeeks > 16 && selectedWeeks <= 20) {
      babyListIndex = 6;
    } else if (selectedWeeks > 20 && selectedWeeks <= 24) {
      babyListIndex = 6;
    } else if (selectedWeeks > 24 && selectedWeeks <= 28) {
      babyListIndex = 7;
    } else if (selectedWeeks > 28 && selectedWeeks <= 32) {
      babyListIndex = 8;
    } else if (selectedWeeks > 32 && selectedWeeks <= 36) {
      babyListIndex = 9;
    } else if (selectedWeeks > 36 && selectedWeeks <= 40) {
      babyListIndex = 10;
    } else {
      babyListIndex = 11;
    }

    currentFirstTrimester = false;
    currentSecondTrimester = false;
    currentThirdTrimester = false;

    if (week <= 12) {
      currentFirstTrimester = true;
    } else if (week > 12 && week <= 26) {
      currentSecondTrimester = true;
    } else {
      currentThirdTrimester = true;
    }

    calculatedTrimester = true;
  }

  void loadBabyImage(int displayedWeek) {
    if (displayedWeek <= 4) {
      [
        setState(() {
          imageUrl =
              'lib/assets/images/pregnancy_tracker_assets/pregnancy_tracker_fetus_1month.png';
          loadedBabyImage = true;
        })
      ];
    } else if (displayedWeek <= 8) {
      [
        setState(() {
          imageUrl =
              'lib/assets/images/pregnancy_tracker_assets/pregnancy_tracker_fetus_2month.png';
          loadedBabyImage = true;
        })
      ];
    } else if (displayedWeek <= 12) {
      [
        setState(() {
          imageUrl =
              'lib/assets/images/pregnancy_tracker_assets/pregnancy_tracker_fetus_3month.png';
          loadedBabyImage = true;
        })
      ];
    } else if (displayedWeek <= 16) {
      [
        setState(() {
          imageUrl =
              'lib/assets/images/pregnancy_tracker_assets/pregnancy_tracker_fetus_4month.png';
          loadedBabyImage = true;
        })
      ];
    } else if (displayedWeek <= 20) {
      [
        setState(() {
          imageUrl =
              'lib/assets/images/pregnancy_tracker_assets/pregnancy_tracker_fetus_5month.png';
          loadedBabyImage = true;
        })
      ];
    } else if (displayedWeek <= 24) {
      [
        setState(() {
          imageUrl =
              'lib/assets/images/pregnancy_tracker_assets/pregnancy_tracker_fetus_6month.png';
          loadedBabyImage = true;
        })
      ];
    } else if (displayedWeek <= 28) {
      [
        setState(() {
          imageUrl =
              'lib/assets/images/pregnancy_tracker_assets/pregnancy_tracker_fetus_7month.png';
          loadedBabyImage = true;
        })
      ];
    } else if (displayedWeek <= 32) {
      [
        setState(() {
          imageUrl =
              'lib/assets/images/pregnancy_tracker_assets/pregnancy_tracker_fetus_8month.png';
          loadedBabyImage = true;
        })
      ];
    } else {
      [
        setState(
          () {
            imageUrl =
                'lib/assets/images/pregnancy_tracker_assets/pregnancy_tracker_fetus_9month.png';
            loadedBabyImage = true;
          },
        )
      ];
    }
  }

  int selectedWeeks = 0;

  @override
  Widget build(BuildContext context) {
    List babyDescription = [
      'The zygote begins to form after fertilization',
      'The zygote implants in the uterine lining',
      'The embryo develops basic structures like the heart and limbs',
      'The fetus has distinct facial features and vital organs are forming',
      'The fetus can make small movements and its digestive system is developing',
      'The fetus has developed to the size of an avocado and can make coordinated movements',
      'The fetus is now the size of a banana and begins to grow fine hair',
      'The fetus is about the size of an ear of corn and its lungs and eyes are developing',
      'The fetus has grown to the size of a butternut squash and its brain and senses are rapidly developing',
      'The fetus is approximately the size of a pineapple and its bones are fully formed but still soft',
      'The fetus is about the size of a honeydew melon and its lungs are nearly mature',
      'The fetus is fully developed and ready for birth, resembling a small watermelon in size'
    ];
    void clearList() {
      exampleList.clear();
    }

    void addList() {
      for (int i = 1; i <= 42; i++) {
        bool containerSelected = false;
        if (selectedWeeks == i) {
          containerSelected = true;
        }
        ;
        exampleList.add(
          Container(
            height: 47,
            width: 47,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: containerSelected ? Colors.white : Colors.transparent),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    clearList();
                    selectedWeeks = i;
                    print(selectedWeeks);
                    calculateTrimester(selectedWeeks);
                    loadBabyImage(selectedWeeks);
                  });
                },
                child: Text('$i',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: containerSelected
                            ? custom_colors.secondaryLightPurple
                            : Colors.white)),
              ),
            ),
          ),
        );
      }
    }

    UserModel currentUser =
        Provider.of<UserProvider>(context, listen: false).userProviderData;
    int pregnantWeeks = int.parse(currentUser.childAge);

    calculatedTrimester ? null : selectedWeeks = pregnantWeeks;
    calculatedTrimester ? null : calculateTrimester(pregnantWeeks);
    loadedBabyImage ? null : loadBabyImage(pregnantWeeks);
    exampleList.isEmpty ? addList() : null;
    print(exampleList.isEmpty);

    return Container(
      padding: const EdgeInsets.only(top: 80, left: 20, right: 20, bottom: 10),
      width: double.infinity,
      height: 610,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xffE5E6FE), Color(0xff8F94FC)]),
          boxShadow: [const BoxShadow(blurRadius: 10)],
          color: custom_colors.secondaryLightPurple,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 165,
            width: 165,
            child: Stack(
              children: [
                Center(
                  child: Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(imageUrl),
                            opacity: 1,
                            fit: BoxFit.cover)),
                  ),
                ),
                Container(
                  height: 165,
                  width: 165,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white30,
                    value: selectedWeeks / 42,
                    strokeWidth: 10,
                    valueColor: const AlwaysStoppedAnimation(Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Trimesters",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: custom_colors.primaryDarkPurple),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedWeeks = pregnantWeeks;
                    loadBabyImage(selectedWeeks);
                    calculateTrimester(selectedWeeks);
                    clearList();
                    addList();
                  });
                },
                child: const Text(
                  "Today",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 12,
              )
            ],
          ),
          const SizedBox(height: 20),
          Container(
            width: 344,
            height: 32,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Row(children: [
              GestureDetector(
                  onTap: () {
                    setState(() {
                      currentSecondTrimester = false;
                      currentThirdTrimester = false;
                      currentFirstTrimester = true;
                      imageUrl =
                          'lib/assets/images/pregnancy_tracker_assets/pregnancy_tracker_fetus_3month.png';
                      selectedWeeks = 13;
                      clearList();
                      addList();
                    });
                  },
                  child: TrimesterSelection("First", currentFirstTrimester)),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      currentSecondTrimester = true;
                      currentThirdTrimester = false;
                      currentFirstTrimester = false;
                      imageUrl =
                          'lib/assets/images/pregnancy_tracker_assets/pregnancy_tracker_fetus_4month.png';
                      selectedWeeks = 14;
                      clearList();
                      addList();
                    });
                  },
                  child: TrimesterSelection("Second", currentSecondTrimester)),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      currentSecondTrimester = false;
                      currentThirdTrimester = true;
                      currentFirstTrimester = false;
                      imageUrl =
                          'lib/assets/images/pregnancy_tracker_assets/pregnancy_tracker_fetus_7month.png';
                      selectedWeeks = 27;
                      clearList();
                      addList();
                    });
                  },
                  child: TrimesterSelection("Third", currentThirdTrimester)),
            ]),
          ),
          const SizedBox(height: 20),
          WeekView(selectedWeeks, exampleList),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Weeks",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
          ),
          Expanded(child: const SizedBox()),
          Text(
            babyDescription[babyListIndex],
            style: const TextStyle(fontSize: 18, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          Expanded(child: SizedBox())
        ],
      ),
    );
  }
}

class WeekView extends StatefulWidget {
  int selectedWeek;
  List exampleWeek;

  WeekView(this.selectedWeek, this.exampleWeek);

  @override
  State<WeekView> createState() => _WeekViewState();
}

class _WeekViewState extends State<WeekView> {
  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController(
      initialScrollOffset: (widget.selectedWeek.toDouble() - 3) *
          77, // or whatever offset you wish
      keepScrollOffset: false,
    );
    return Container(
      width: double.infinity,
      height: 60,
      child: ListView.builder(
        controller: scrollController,
        clipBehavior: Clip.none,
        padding: EdgeInsets.zero,
        primary: false,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: widget.exampleWeek.length,
        itemBuilder: (_, index) {
          return Row(
            children: [
              widget.exampleWeek[index],
              const SizedBox(
                width: 30,
              ),
            ],
          );
        },
      ),
    );
  }
}

class TrimesterSelection extends StatefulWidget {
  String title;
  bool currentTrimester;

  TrimesterSelection(this.title, this.currentTrimester);

  @override
  State<TrimesterSelection> createState() => _TrimesterSelectionState();
}

class _TrimesterSelectionState extends State<TrimesterSelection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 114.6,
      height: 32,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: widget.currentTrimester
            ? custom_colors.secondaryLightPurple
            : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        widget.title,
        style: TextStyle(
          fontSize: 16,
          color: widget.currentTrimester
              ? Colors.white
              : custom_colors.primaryDarkPurple,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
