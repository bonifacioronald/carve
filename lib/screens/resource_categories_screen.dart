import 'dart:ffi';

import 'package:carve_app/main.dart';
import 'package:carve_app/widgets/category_button.dart';
import 'package:carve_app/widgets/map_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/colors.dart' as custom_colors;
import '../models/resources_model.dart';
import '../providers/resource_provider.dart';

class ResourceCategories extends StatelessWidget {
  static const routeName = '/resources-categories';
  String categories = '';
  String title1 = '';
  String location1 = '';
  String URLDirection1 = '';
  String title2 = '';
  String location2 = '';
  String URLDirection2 = '';
  String title3 = '';
  String location3 = '';
  String URLDirection3 = '';

  List numbers = [];

  @override
  Widget build(BuildContext context) {
    ResourcesModel currentResource =
        Provider.of<ResourceProvider>(context, listen: false)
            .resourceProviderData;

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
                                categories,
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
                                    "Search for $categories...",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 200,
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
                            "Nearest $categories",
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CategoriesButton(title1, URLDirection1),
                          CategoriesButton(title2, URLDirection2),
                          CategoriesButton(title3, URLDirection3)
                        ],
                      ),
                    )
                  ]),
            )));
  }
}
