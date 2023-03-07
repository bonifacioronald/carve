import 'dart:ffi';

import 'package:carve_app/main.dart';
import 'package:carve_app/widgets/category_button.dart';
import 'package:carve_app/widgets/map_screen_widgets.dart';
import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;

class FoodBank extends StatelessWidget {
  const FoodBank({super.key});
  static const routeName = '/resources-categories';

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
                                    fontSize: 23, fontWeight: FontWeight.bold),
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
                        height: 45,
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
                      padding: EdgeInsets.only(top: 20, left: 20),
                      width: double.infinity,
                      height: 700,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                              ),
                              height: 350,
                              width: 350,
                              child: Stack(
                                children: [
                                  CurrentLocationScreen(),
                                ],
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Nearest Food Bank",
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CategoriesButton("Pj City Food Bank"),
                          CategoriesButton("Provider for All"),
                          CategoriesButton("Food Bank Malaysia")
                        ],
                      ),
                    )
                  ]),
            )));
  }
}
