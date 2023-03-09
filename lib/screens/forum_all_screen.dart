import 'package:carve_app/providers/forum_provider.dart';
import 'package:carve_app/screens/forum_detail_screen.dart';
import 'package:carve_app/widgets/forum_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/forum_Category.dart';
import '/models/colors.dart' as custom_colors;

class forumAll extends StatefulWidget {
  static const routeName = '/forum-all';
  const forumAll({super.key});

  @override
  State<forumAll> createState() => _forumAllState();
}

class _forumAllState extends State<forumAll> {
  bool _isLoading = true;
  // bool isClicked = false;
  int currentClickedIndex = 1;

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
              padding: EdgeInsets.only(right: 28),
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.search, size: 36, color: Color(0XFF02084B)),
            )
          ],
          leading: IconButton(
            padding: EdgeInsets.only(left: 8),
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_new,
                size: 32, color: Color(0XFF02084B)),
          )),
      body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 16, left: 24, right: 24),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("All Forums",
                    style: TextStyle(
                        color: Color(0XFF02084B),
                        fontSize: 32,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 12),

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
                              totalReplies:
                                  _provider.loadedForumList[index].totalReplies,
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
                // ForumCard(
                //     "Benjamin",
                //     "12h ago",
                //     "Pregnancy",
                //     "Is it considered rude to ask who the father is when a woman announces her pregnancy?",
                //     "120",
                //     "60"),
                // ForumCard(
                //     "Benjamin",
                //     "12h ago",
                //     "Pregnancy",
                //     "Is it considered rude to ask who the father is when a woman announces her pregnancy?",
                //     "120",
                //     "60"),
                // ForumCard(
                //     "Benjamin",
                //     "12h ago",
                //     "Pregnancy",
                //     "Is it considered rude to ask who the father is when a woman announces her pregnancy?",
                //     "120",
                //     "60"),
                // ForumCard(
                //     "Benjamin",
                //     "12h ago",
                //     "Pregnancy",
                //     "Is it considered rude to ask who the father is when a woman announces her pregnancy?",
                //     "120",
                //     "60"),
                // ForumCard(
                //     "Benjamin",
                //     "12h ago",
                //     "Pregnancy",
                //     "Is it considered rude to ask who the father is when a woman announces her pregnancy?",
                //     "120",
                //     "60"),
              ],
            ),
          )),
    );
  }
}
