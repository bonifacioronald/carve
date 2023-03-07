import 'package:auto_size_text/auto_size_text.dart';
import 'package:carve_app/widgets/content_library_card.dart';
import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;

class ContentLibraryScreen extends StatelessWidget {
  const ContentLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 1139,
          color: custom_colors.primaryDarkPurple,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top + 50,
                    left: 30,
                    right: 30),
                child: Text(
                  "What to Learn?",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(left: 30, right: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 81,
                      height: 85,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              image: AssetImage(
                                  "lib/assets/images/Content_Library_Assets/content_library_pregnant_mother.png"),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 250,
                          child: AutoSizeText(
                            "This should be a variable that takes in the content title",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            maxFontSize: 17,
                            minFontSize: 15,
                            maxLines: 2,
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          width: 230,
                          height: 10,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: LinearProgressIndicator(
                              minHeight: 5,
                              color: custom_colors.secondaryLightPurple,
                              backgroundColor: Colors.white,
                              value:
                                  0.8, //THIS SHOULD BE A VARIABLE THAT CHANGES BASED ON THE USER PROGRESS
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "% the above progress bar",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(left: 30, right: 30, top: 25),
                width: MediaQuery.of(context).size.width,
                height: 900,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    image: DecorationImage(
                        image: AssetImage(
                            "lib/assets/images/Content_Library_Assets/content_library_background.png"),
                        fit: BoxFit.cover)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Recommendations for you",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: custom_colors.primaryDarkPurple),
                        ),
                        Spacer(),
                        Icon(
                          Icons.filter_alt_sharp,
                          color: custom_colors.primaryDarkPurple,
                          size: 21,
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 240,
                      width: 800, //this sould be a variable
                      // color: Colors.brown,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              ContentLibraryCard(
                                  "category", "title", "image url"),
                              SizedBox(
                                width: 20,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("This should be a variable as well",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: custom_colors.primaryDarkPurple)),
                    Container(
                      height: 240,
                      width: 800, //this sould be a variable
                      // color: Colors.brown,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              ContentLibraryCard(
                                  "category", "title", "image url"),
                              SizedBox(
                                width: 20,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("Popular",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: custom_colors.primaryDarkPurple)),
                    Container(
                      height: 240,
                      width: 800, //this sould be a variable
                      // color: Colors.brown,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              ContentLibraryCard(
                                  "category", "title", "image url"),
                              SizedBox(
                                width: 20,
                              )
                            ],
                          );
                        },
                      ),
                    )
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
