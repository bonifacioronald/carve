import 'package:carve_app/models/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/content_provider.dart';
import '../widgets/content_library_card.dart';
import '../widgets/resources_main_card.dart';
import 'content_library_story_screen.dart';
import 'loading_screen.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});
  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  bool _isLoading = true;
  @override
  void initState() {
    // TODO: implement initState

    var _provider = Provider.of<ContentProvider>(context, listen: false);
    if (_provider.contentIdList.isEmpty) {
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
    } else {
      setState(() {
        _isLoading = false;
      });
    }

    super.initState();
  }

  Widget build(BuildContext context) {
    var _provider = Provider.of<ContentProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: backgroundPurple,
      body: _isLoading
          ? LoadingScreen()
          : SingleChildScrollView(
              child: Container(
                height: 3000,
                padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 60,
                    top: MediaQuery.of(context).padding.top + 20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Discover",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                            color: primaryDarkPurple)),
                    SizedBox(height: 20),
                    Text("Resources",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: primaryDarkPurple)),

                    SizedBox(height: 20),
                    Container(
                      child: SingleChildScrollView(
                        clipBehavior: Clip.none,
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ResourcesMainCard(
                                'Pregnancy Classes',
                                'https://images.ctfassets.net/9wtva4vhlgxb/6QWEHMlC0gSnCAdZVYJuvJ/321f0c3ae02c30b4cf45cc7ec6037559/mask_3x.webp',
                                'Pregnancy Classes'),
                            SizedBox(
                              width: 20,
                            ),
                            ResourcesMainCard(
                                'Family Therapy',
                                'https://www.arkansasrelationshipcenter.com/wp-content/uploads/2019/02/Family-therapy-family-counseling-little-rock-common-family-therapy-issues-1080x675.jpg',
                                'Therapy'),
                            SizedBox(
                              width: 20,
                            ),
                            ResourcesMainCard(
                                'Food Bank',
                                'https://assets.hmetro.com.my/images/articles/food_1585123849.jpg',
                                'Food Bank'),
                            SizedBox(
                              width: 20,
                            ),
                            ResourcesMainCard(
                              'Daycare',
                              'https://media.istockphoto.com/id/1402700264/photo/teacher-with-a-group-of-elementary-students-playing-with-toy-blocks.jpg?b=1&s=170667a&w=0&k=20&c=pC8b5jyKPBJoOr0_kjHFMEtKARgjPrF_HUkvpoPF8pw=',
                              'Daycare',
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ResourcesMainCard(
                              'Adoption Agency',
                              'https://www.holtinternational.org/wp-content/uploads/2022/02/2882ebac5a32-4ae7-4d37-be6b-bcbcd74627f8-8894-000004ae1a480abd.jpg',
                              'Adoption Agency',
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ResourcesMainCard(
                              'Marriage Counselling',
                              'https://media.istockphoto.com/id/1148848093/photo/marriage-therapy.jpg?s=612x612&w=0&k=20&c=95sWBPdDCIhj1fOg33L4Zm0Rt4kwFqu33fFbFBtCm_Q=',
                              'Marriage Counselling',
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ResourcesMainCard(
                              'Charities',
                              'https://media.istockphoto.com/id/1017183652/photo/team-teamwork-business-join-hand-together-concept-power-of-volunteer-charity-work-stack-of.jpg?b=1&s=612x612&w=0&k=20&c=3Zm8E7nSUPInwDswufGx9kyA_sj8MmasH-2_yggC_z0=',
                              'Charities',
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ResourcesMainCard(
                              'Babysitter',
                              'https://media.istockphoto.com/id/1402700264/photo/teacher-with-a-group-of-elementary-students-playing-with-toy-blocks.jpg?b=1&s=170667a&w=0&k=20&c=pC8b5jyKPBJoOr0_kjHFMEtKARgjPrF_HUkvpoPF8pw=',
                              'Daycare',
                            ),
                          ],
                        ),
                      ),
                    ), //resources cards
                    SizedBox(height: 20),
                    Text("Planning Tools",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: primaryDarkPurple)),
                    SizedBox(height: 20), //planning tools texts
                    Text(
                      'Articles',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: primaryDarkPurple),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 300 *
                              _provider.loadedContentList.length.toDouble() +
                          (20 * _provider.loadedContentList.length.toDouble() -
                              1), //Chnage this to the specific height needed (totalArticles * heightOfEach + spacing)
                      padding: EdgeInsets.zero,
                      width: double.infinity,
                      child: ListView.builder(
                        clipBehavior: Clip.none,
                        padding: EdgeInsets.zero,
                        primary: false,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _provider.loadedContentList.length,
                        itemBuilder: (_, index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: (() => Navigator.of(context).pushNamed(
                                    ContentLibraryStory.routeName,
                                    arguments:
                                        _provider.loadedContentList[index])),
                                child: ContentLibraryCard(
                                    contentTitle: _provider
                                        .loadedContentList[index].title,
                                    contentCategory: _provider
                                        .loadedContentList[index]
                                        .suitableCategories[0],
                                    contentImageUrl: _provider
                                        .loadedContentList[index].thumbnailUrl,
                                    contentDesc: _provider
                                        .loadedContentList[index].content[0]),
                              ),
                              SizedBox(height: 20),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
