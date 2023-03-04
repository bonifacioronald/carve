import 'package:carve_app/widgets/categories_button.dart';
import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;

class local_class extends StatelessWidget {
  const local_class({super.key});

  @override
  Widget build(BuildContext context) {
    const routeName = "/local-pregnancy";

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
                    Container(
                      padding: EdgeInsets.only(),
                      height: 50,
                      width: 70,
                      child: Row(children: [
                        Icon(
                          Icons.keyboard_arrow_left_sharp,
                          size: 60,
                        )
                      ]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: 400,
                        height: 40,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Pregnancy Class Available",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 27),
                                )
                              ],
                            ),
                          ],
                        )),
                    Container(
                      padding: EdgeInsets.only(top: 10, left: 20, right: 20),
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
                                            'lib/assets/images/LYC mother and child center.jpeg'),
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
