import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;

class FoodBank extends StatelessWidget {
  const FoodBank({super.key});
  static const routeName = '/local-parenting-class';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Color(0xffe8e9fe),
            body: SingleChildScrollView(
              padding: EdgeInsets.only(top: 40),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        padding: EdgeInsets.only(),
                        height: 70,
                        width: 400,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.keyboard_arrow_left_sharp,
                                size: 60,
                              ),
                              Text(
                                "Local Food Bank",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              )
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    //search bar
                    Container(
                        padding: EdgeInsets.only(),
                        width: 400,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 15),
                              height: 45,
                              width: 350,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Search for Food Bank...",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 135,
                                  ),
                                  Icon(
                                    Icons.search,
                                    size: 30,
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                    Container(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              top: 15,
                            ),
                            width: 350,
                            height: 320,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "LYC Mother & Child Center",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'lib/assets/images/LYC_mother_and_child_center.jpeg'),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  width: 300,
                                  height: 150,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 110,
                                  width: 300,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Address:",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                          "Plaza Vads, Level 2, Podium, 1, Jalan Tun Mohd Fuad, Taman Tun Dr Ismail, 60000 Kuala Lumpur"),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Center(
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                    backgroundColor:
                                                        Color(0xFF02084B)),
                                                onPressed: () {},
                                                child: Text(
                                                  "Reserve",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                )),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.only(
                              top: 15,
                            ),
                            width: 350,
                            height: 320,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Prana Yoga KL",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'lib/assets/images/prana_yoga_kl.jpeg'),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  width: 300,
                                  height: 150,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 110,
                                  width: 300,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Address:",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                          "Unit 2.3, 2nd Floor, 48, Jalan Tun Mohd Fuad, Taman Tun Dr Ismail, 60000 Kuala Lumpur"),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Center(
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                    backgroundColor:
                                                        Color(0xFF02084B)),
                                                onPressed: () {},
                                                child: Text(
                                                  "Reserve",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    )
                  ]),
            )));
  }
}
