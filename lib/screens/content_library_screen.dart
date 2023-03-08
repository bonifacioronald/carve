import 'package:auto_size_text/auto_size_text.dart';
import 'package:carve_app/providers/content_provider.dart';
import 'package:carve_app/screens/loading_screen.dart';
import 'package:carve_app/widgets/content_library_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/colors.dart' as custom_colors;
import '../providers/daily_content_provider.dart';

class ContentLibraryScreen extends StatefulWidget {
  const ContentLibraryScreen({super.key});

  @override
  State<ContentLibraryScreen> createState() => _ContentLibraryScreenState();
}

class _ContentLibraryScreenState extends State<ContentLibraryScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    var _provider = Provider.of<ContentProvider>(context, listen: false);
    _provider.fetchContentId().then(
      (_) {
        print('Successfuly fetched ${_provider.contentIdList.length} ids');
        _provider.fetchAllContentData().then(
          (_) {
            setState(
              () {
                _isLoading = false;
              },
            );
          },
        );
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<ContentProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: _isLoading
            ? LoadingScreen()
            : Container(
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
                              itemCount: _provider.contentIdList.length,
                              itemBuilder: (_, index) {
                                return Row(
                                  children: [
                                    ContentLibraryCard(
                                        contentTitle: _provider
                                            .loadedContentList[index].title,
                                        contentCategory: _provider
                                            .loadedContentList[index]
                                            .suitableCategories[0],
                                        contentImageUrl: "image url"),
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
                                      contentCategory: "category",
                                      contentTitle: "title",
                                      contentImageUrl: "image url",
                                    ),
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
                                        contentCategory: "category",
                                        contentTitle: "title",
                                        contentImageUrl: "image url"),
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
