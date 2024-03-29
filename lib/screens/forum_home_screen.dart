import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/forum_provider.dart';
import '../screens/forum_all_screen.dart';
import '../screens/forum_detail_screen.dart';
import '../screens/loading_screen.dart';
import '../models/colors.dart' as custom_colors;
import '../widgets/create_button.dart';
import '../widgets/forum_card.dart';

class ForumHomeScreen extends StatefulWidget {
  const ForumHomeScreen({super.key});

  @override
  State<ForumHomeScreen> createState() => _ForumHomeScreenState();
}

class _ForumHomeScreenState extends State<ForumHomeScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    var _provider = Provider.of<ForumProvider>(context, listen: false);
    if (_provider.forumIdList.isEmpty) {
      _provider.fetchForumId().then(
        (_) {
          print('Successfuly fetched ${_provider.forumIdList.length} ids');
          _provider.fetchAllForumData().then(
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
      setState(
        () {
          _isLoading = false;
        },
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<ForumProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: custom_colors.backgroundPurple,
      body: _isLoading
          ? LoadingScreen()
          : RefreshIndicator(
              onRefresh: () async {},
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top + 20,
                    left: 20,
                    right: 20,
                    bottom: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Need Any Support?\nAsk Here!",
                        style: TextStyle(
                            color: custom_colors.primaryDarkPurple,
                            fontSize: 32,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),
                    Text(
                        "Join and connect with parents in the community nearby",
                        style: TextStyle(
                            color: custom_colors.primaryDarkPurple
                                .withOpacity(0.5),
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),
                    // Create forum button
                    const CreateButton("Create Forum"),
                    const SizedBox(height: 20),
                    Divider(
                      color: custom_colors.primaryDarkPurple.withOpacity(0.1),
                      thickness: 2,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recommended Forums',
                          style: TextStyle(
                              fontSize: 20,
                              color: custom_colors.primaryDarkPurple,
                              fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: (() => Navigator.of(context)
                              .pushNamed(ForumAllScreen.routeName)),
                          child: Container(
                            child: Text(
                              'See All',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: custom_colors.secondaryLightPurple,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      height: _provider.forumIdList.length * 200 +
                          _provider.forumIdList.length * 20,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _provider.forumIdList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: (() => Navigator.of(context).pushNamed(
                                    forumPage.routeName,
                                    arguments:
                                        _provider.loadedForumList[index])),
                                child: ForumCard(
                                  authorName: _provider
                                      .loadedForumList[index].authorName,
                                  publishedDate: _provider
                                      .loadedForumList[index].publishedDate,
                                  category:
                                      _provider.loadedForumList[index].category,
                                  title: _provider.loadedForumList[index].title,
                                  totalLikes: _provider
                                      .loadedForumList[index].totalLikes,
                                  totalReplies: _provider
                                      .loadedForumList[index].totalReplies,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              )
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
