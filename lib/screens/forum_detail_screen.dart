import 'package:carve_app/models/forum_model.dart';
import 'package:carve_app/models/user_model.dart';
import 'package:carve_app/providers/forum_provider.dart';
import 'package:carve_app/providers/forum_reply_provider.dart';
import 'package:carve_app/providers/user_provider.dart';
import 'package:carve_app/widgets/forum_content_page_card.dart';
import 'package:carve_app/widgets/reply_button.dart';
import 'package:carve_app/widgets/reply_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/models/colors.dart' as custom_colors;

class forumPage extends StatefulWidget {
  static const routeName = '/forum-detail';
  const forumPage({super.key});

  @override
  State<forumPage> createState() => _forumPageState();
}

class _forumPageState extends State<forumPage> {
  bool _isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    var _provider = Provider.of<ForumReplyProvider>(context, listen: false);
    if (_provider.forumReplyIdList.isEmpty) {
      _provider.fetchForumId().then(
        (_) {
          print('Successfuly fetched ${_provider.forumReplyIdList.length} ids');
          _provider.fetchAllForumReplyData().then(
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
    UserModel currentUser =
        Provider.of<UserProvider>(context, listen: false).userProviderData;
    ForumModel displayedContent =
        ModalRoute.of(context)!.settings.arguments as ForumModel;

    var _provider = Provider.of<ForumReplyProvider>(context, listen: false);
    _provider.selectDisplayedForumReplybyId(displayedContent.id);
    return Scaffold(
        backgroundColor: custom_colors.backgroundPurple,
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Color(0XE8E9FE),
          elevation: 0,
          leading: IconButton(
            padding: EdgeInsets.only(left: 8),
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_new,
                size: 32, color: Color(0XFF02084B)),
          ),
          titleSpacing: 0,
          title: Text("View Forum",
              style: TextStyle(
                  color: Color(0XFF02084B),
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(children: [
                      forumContentCard(
                          authorName: displayedContent.authorName,
                          category: displayedContent.category,
                          title: displayedContent.title,
                          content: displayedContent.content,
                          totalLikes: displayedContent.totalLikes,
                          publishedDate: displayedContent.publishedDate),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Text("Replies (24)",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(width: 120),
                          Text("See all replies",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0XFF02084B))),
                        ],
                      ),
                      SizedBox(height: 16),
                      Container(
                          width: double.infinity,
                          height:
                              _provider.filteredForumReplyList.length * 106 +
                                  _provider.filteredForumReplyList.length * 16 +
                                  168,
                          child: ListView.builder(
                              itemCount:
                                  _provider.filteredForumReplyList.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    replyCard(
                                      authorName: _provider
                                          .filteredForumReplyList[index]
                                          .authorName,
                                      content: _provider
                                          .filteredForumReplyList[index]
                                          .content,
                                      publishedDate: _provider
                                          .filteredForumReplyList[index]
                                          .publishedDate,
                                    ),
                                    SizedBox(height: 16)
                                  ],
                                );
                              })),
                      SizedBox(height: 16),
                      ReplyButton(),
                    ]),
                  )
                ])));
  }
}
