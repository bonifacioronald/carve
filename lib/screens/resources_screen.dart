import 'package:carve_app/widgets/categories_button.dart';
import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;

class ResourcesScreen extends StatelessWidget {
  const ResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe8e9fe),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, right: 20, top: 60),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Nearby Resources",
                    style: TextStyle(
                      color: Color(0xFF02084B),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),
                Icon(
                  Icons.search,
                  size: 30,
                ),
              ],
            ),
          ),

          SizedBox(
            height: 20,
          ),

          //first container
          Container(
            width: double.infinity,
            height: 160,
            padding: EdgeInsets.only(top: 20, left: 15, bottom: 25, right: 10),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'lib/assets/images/daily_content_card_bg.png'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 2),
                        height: 60,
                        width: 187,
                        child: Column(children: [
                          Text(
                            "Attend Local\nPregnancy Class",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                                width: 151,
                                height: 40,
                                padding: EdgeInsets.only(left: 8),
                                decoration: BoxDecoration(
                                    color: Color(0xFF02084B),
                                    borderRadius:
                                        BorderRadiusDirectional.circular(15)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text("Book Now",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20)),
                                        SizedBox(
                                          width: 13,
                                        ),
                                        Icon(Icons.room_service_outlined,
                                            color: Colors.white)
                                      ],
                                    )
                                  ],
                                )),
                          )
                        ],
                      ),
                    ],
                  ),
                  // second container
                  Center(
                    child: Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/images/Pregnancy 4.png'))),
                      child: Row(children: []),
                    ),
                  )
                ]),
          ),

          //categories
          SizedBox(
            height: 30,
          ),
          Container(
              padding: EdgeInsets.only(right: 20),
              width: double.infinity,
              height: 50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  (Text(
                    "Categories",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )),
                  Text("See all",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF8E93FB),
                          fontWeight: FontWeight.bold))
                ],
              )),

          Container(
            width: double.infinity,
            height: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Buttons(Colors.white, Icons.baby_changing_station_rounded,
                    Colors.black, "Postpartum\n        care"),
                Buttons(Colors.white, Icons.handshake_rounded,
                    Color.fromARGB(255, 208, 200, 151), "Therapy"),
                Buttons(Colors.white, Icons.phone_in_talk_sharp, Colors.red,
                    "   Marriage\n Counseling"),
                Buttons(
                    Colors.white, Icons.school_outlined, Colors.blue, "Daycare")
              ],
            ),
          ),

          SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Buttons(Colors.white, Icons.payments_outlined,
                    Color(0xFF008000), "Charities"),
                Buttons(Colors.white, Icons.food_bank, Colors.blueGrey,
                    "Food\nBank"),
                Buttons(Colors.white, Icons.house_outlined, Colors.amber,
                    " Adoption\n  Agency"),
                Buttons(Colors.white, Icons.stroller_outlined,
                    Colors.deepPurpleAccent, "Babysitter")
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              height: 50,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Recommended for you",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF02084B)),
                  )
                ],
              )),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  width: 140,
                  height: 140,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'lib/assets/images/food icon.png'),
                                    fit: BoxFit.cover),
                              ),
                              height: 80,
                              width: 80,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                              )),
                        ],
                      ),
                      Text(
                        "Pregnant Diet\nConsultation",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      width: 192,
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Find Free\nPrenatal Care",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.free_breakfast,
                            size: 40,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      width: 192,
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Call 15999\nPregnancy Hotline",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.call,
                            color: Colors.red,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
