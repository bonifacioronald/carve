import 'dart:ffi';

import 'package:carve_app/main.dart';
import 'package:carve_app/widgets/category_button.dart';
import 'package:carve_app/widgets/map_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/colors.dart' as custom_colors;
import '../models/colors.dart';
import '../models/resources_model.dart';
import '../providers/resource_provider.dart';
import '../widgets/search_bar.dart';

class ResourceCategories extends StatelessWidget {
  static const routeName = '/resources-categories';
  String categories = '';
  String title = '';
  String location = '';
  String URLDirection = '';
  

  List numbers = [];

  @override
  Widget build(BuildContext context) {

    // ResourcesModel title =
    //     ModalRoute.of(context)!.settings.arguments as ResourcesModel;
    //     ResourcesModel URLDirection =
    //     ModalRoute.of(context)!.settings.arguments as ResourcesModel;
       

        
        

    return MaterialApp(
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Color(0xffe8e9fe),
            body: SingleChildScrollView(
              padding: EdgeInsets.only(top: 40, left:20,right:20),
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
                    SearchBar("Search for $categories",Colors.white,primaryDarkPurple),
                    SizedBox(height:10),
                    Container(
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
                          SizedBox(height:20),
                          Container(
                            height: 205,
                            width: double.infinity,
                            color: backgroundPurple,
                            child:ListView.builder(
                              padding: EdgeInsets.zero,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 3,
                              itemBuilder: (_, index){

                                return Column(
                                  
                                  children: [
                                     CategoriesButton(title, URLDirection),
                                ]);



                              }


                              
                            
                            
                            )

                          ),
                         
                          // CategoriesButton(title, URLDirection),
                          // CategoriesButton(title, URLDirection)
                        ],
                      ),
                    )
                  ]),
            )));
  }
}
