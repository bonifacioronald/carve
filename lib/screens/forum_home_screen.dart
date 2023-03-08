import 'package:carve_app/providers/forum_provider.dart';
import 'package:carve_app/screens/forum_all_screen.dart';
import 'package:carve_app/screens/forum_detail_screen.dart';
import 'package:carve_app/screens/loading_screen.dart';
import 'package:carve_app/widgets/icon_switching.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/colors.dart' as custom_colors;
import 'package:carve_app/widgets/create_button.dart';
import 'package:carve_app/widgets/forum_card.dart';

class ForumScreen extends StatefulWidget {
  const ForumScreen({super.key});

  @override
  State<ForumScreen> createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
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
      setState(() {
        _isLoading = false;
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<ForumProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: custom_colors.backgroundPurple,
      appBar: AppBar(
        backgroundColor: Color(0XE8E9FE),
        elevation: 0,
        actions: [
          IconButton(
              padding: EdgeInsets.only(right: 16),
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: iconSwitching(
                  Icons.notifications_none,
                  Icons.notifications_active,
                  36.0,
                  custom_colors.primaryDarkPurple))
        ],
      ),
      body: _isLoading
          ? LoadingScreen()
          : SingleChildScrollView(
              padding:
                  EdgeInsets.only(top: 16, left: 20, right: 20, bottom: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Need Any Support?",
                      style: TextStyle(
                          color: Color(0XFF02084B),
                          fontSize: 32,
                          fontWeight: FontWeight.bold)),
                  Text("Ask Here!",
                      style: TextStyle(
                          color: Color(0XFF02084B),
                          fontSize: 32,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 16),
                  Text("Join and connect with parents in the",
                      style: TextStyle(
                          color: Color(0XFF02084B).withOpacity(0.5),
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  Text("community nearby",
                      style: TextStyle(
                          color: Color(0XFF02084B).withOpacity(0.5),
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  // Create forum button
                  createButton("Create Forum"),
                  SizedBox(height: 20),
                  Divider(
                    color: Color(0XFF02084B).withOpacity(0.1),
                    thickness: 2,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Recommended Forums",
                          style: TextStyle(
                              color: Color(0XFF02084B),
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      Container(
                          child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(forumAll.routeName);
                        },
                        child: Text("See All Posts",
                            style: TextStyle(
                                color: Color(0XFF8E93FB),
                                fontSize: 16,
                                fontWeight: FontWeight.w600)),
                      )),
                    ],
                  ),
                  SizedBox(height: 20),

                  Container(
                    width: double.infinity,
                    height: _provider.forumIdList.length * 200 +
                        _provider.forumIdList.length * 20,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _provider.forumIdList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: (() => Navigator.of(context).pushNamed(
                                  forumPage.routeName,
                                  arguments: _provider.loadedForumList[index])),
                              child: ForumCard(
                                authorName:
                                    _provider.loadedForumList[index].authorName,
                                publishedDate: _provider
                                    .loadedForumList[index].publishedDate,
                                category:
                                    _provider.loadedForumList[index].category,
                                title: _provider.loadedForumList[index].title,
                                totalLikes:
                                    _provider.loadedForumList[index].totalLikes,
                                totalReplies: _provider
                                    .loadedForumList[index].totalReplies,
                              ),
                            ),
                            SizedBox(
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
    );
  }
}
