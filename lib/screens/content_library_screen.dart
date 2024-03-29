import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/content_provider.dart';
import '../screens/content_library_story_screen.dart';
import '../screens/loading_screen.dart';
import '../widgets/content_library_card.dart';
import '../models/colors.dart' as custom_colors;

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
      body: _isLoading
          ? LoadingScreen()
          : SingleChildScrollView(
              child: Container(
                width: 1000,
                height: 895,
                padding: EdgeInsets.zero,
                color: custom_colors.primaryDarkPurple,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top + 20,
                          left: 30,
                          right: 30),
                      child: const Text(
                        "What to Learn?",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.only(left: 30, right: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 81,
                            height: 85,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: const DecorationImage(
                                    image: AssetImage(
                                        "lib/assets/images/Content_Library_Assets/content_library_pregnant_mother.png"),
                                    fit: BoxFit.cover)),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 250,
                                child: AutoSizeText(
                                  _provider.loadedContentList[0].title,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  maxFontSize: 17,
                                  minFontSize: 15,
                                  maxLines: 2,
                                ),
                              ),
                              const SizedBox(height: 15),
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
                                        0, //THIS SHOULD BE A VARIABLE THAT CHANGES BASED ON THE USER PROGRESS
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                "0% completed",
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
                    const SizedBox(height: 20),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                            image: DecorationImage(
                                image: AssetImage(
                                    "lib/assets/images/Content_Library_Assets/content_library_background.png"),
                                fit: BoxFit.fitWidth)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, top: 15, right: 20),
                              child: Row(
                                children: [
                                  Text(
                                    "Recommended",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: custom_colors.primaryDarkPurple),
                                  ),
                                  const Spacer(),
                                  Icon(
                                    Icons.filter_alt_sharp,
                                    color: custom_colors.primaryDarkPurple,
                                    size: 21,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              padding: const EdgeInsets.only(left: 20),
                              height: 280,
                              width: 800,
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                itemBuilder: (_, index) {
                                  return Row(
                                    children: [
                                      GestureDetector(
                                        onTap: (() => Navigator.of(context)
                                            .pushNamed(
                                                ContentLibraryStory.routeName,
                                                arguments: _provider
                                                    .loadedContentList[index])),
                                        child: ContentLibraryCard(
                                          contentTitle: _provider
                                              .loadedContentList[index].title,
                                          contentCategory: _provider
                                              .loadedContentList[index]
                                              .suitableCategories[0],
                                          contentImageUrl: _provider
                                              .loadedContentList[index]
                                              .thumbnailUrl,
                                          contentDesc: _provider
                                              .loadedContentList[index]
                                              .content[0],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 25,
                                      )
                                    ],
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20, bottom: 10),
                              child: Text("Popular",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: custom_colors.primaryDarkPurple)),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 20),
                              height: 280,
                              width: 800,
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    _provider.loadedContentList.length - 2,
                                itemBuilder: (_, index) {
                                  return Row(
                                    children: [
                                      GestureDetector(
                                        onTap: (() => Navigator.of(context)
                                            .pushNamed(
                                                ContentLibraryStory.routeName,
                                                arguments:
                                                    _provider.loadedContentList[
                                                        index + 2])),
                                        child: ContentLibraryCard(
                                          contentTitle: _provider
                                              .loadedContentList[index].title,
                                          contentCategory: _provider
                                              .loadedContentList[index]
                                              .suitableCategories[0],
                                          contentImageUrl: _provider
                                              .loadedContentList[index]
                                              .thumbnailUrl,
                                          contentDesc: _provider
                                              .loadedContentList[index]
                                              .content[0],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 25,
                                      )
                                    ],
                                  );
                                },
                              ),
                            ),
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
