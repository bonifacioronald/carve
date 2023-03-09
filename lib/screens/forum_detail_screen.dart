import 'package:carve_app/models/forum_model.dart';
import 'package:carve_app/models/user_model.dart';
import 'package:carve_app/providers/forum_provider.dart';
import 'package:carve_app/providers/forum_reply_provider.dart';
import 'package:carve_app/providers/user_provider.dart';
import 'package:carve_app/screens/forum_home_screen.dart';
import 'package:carve_app/screens/loading_screen.dart';
import 'package:carve_app/widgets/forum_content_page_card.dart';
import 'package:carve_app/widgets/reply_button.dart';
import 'package:carve_app/widgets/reply_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/forum_reply_model.dart';
import '/models/colors.dart' as custom_colors;
import 'package:intl/intl.dart';

class forumPage extends StatefulWidget {
  static const routeName = '/forum-detail';
  const forumPage({super.key});

  @override
  State<forumPage> createState() => _forumPageState();
}

class _forumPageState extends State<forumPage> {
  final TextEditingController _content = TextEditingController();
  bool _isLoading = true;

  void initState() {
    // TODO: implement initState
    var _provider = Provider.of<ForumReplyProvider>(context, listen: false);
    if (_provider.forumReplyIdList.isEmpty) {
      _provider.fetchForumReplyId().then(
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
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MMM dd').format(now);
    UserModel currentUser =
        Provider.of<UserProvider>(context, listen: false).userProviderData;
    ForumModel displayedContent =
        ModalRoute.of(context)!.settings.arguments as ForumModel;
    var _provider2 = Provider.of<ForumReplyProvider>(context);
    _provider2.selectDisplayedForumReplybyId(displayedContent.id);

    return Scaffold(
        backgroundColor: custom_colors.backgroundPurple,
        resizeToAvoidBottomInset: false,
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
        body: _isLoading
            ? LoadingScreen()
            : SingleChildScrollView(
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
                              Text(
                                  "Replies (${_provider2.filteredForumReplyList.length})",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
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
                              height: _provider2.filteredForumReplyList.length *
                                      106 +
                                  _provider2.filteredForumReplyList.length *
                                      16 +
                                  168,
                              child: ListView.builder(
                                  itemCount:
                                      _provider2.filteredForumReplyList.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        replyCard(
                                          authorName: _provider2
                                              .filteredForumReplyList[index]
                                              .authorName,
                                          content: _provider2
                                              .filteredForumReplyList[index]
                                              .content,
                                          publishedDate: _provider2
                                              .filteredForumReplyList[index]
                                              .publishedDate,
                                        ),
                                        SizedBox(height: 16)
                                      ],
                                    );
                                  })),
                          SizedBox(height: 16),
                          Container(
                            width: 348,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: TextField(
                              controller: _content,
                              textAlign: TextAlign.left,
                              decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      _provider2.submitNewReplyToFirebase(
                                          currentUser.name,
                                          _content.text,
                                          displayedContent.id,
                                          '',
                                          formattedDate);
                                      _content.clear();
                                      Navigator.of(context).pop();
                                      // setState() {

                                      //   _provider.updateForumReplyList();
                                      //   _isLoading = true;
                                      //   print('IS LOADINGG: $_isLoading');
                                      // }

                                      // print(currentUser.name);
                                      // print(displayedContent.id);
                                      // print(_content.text);
                                    },
                                    child: Icon(Icons.send,
                                        color: Color(0XFF02084B))),
                                contentPadding:
                                    EdgeInsets.only(left: 16, right: 16),
                                fillColor: Color(0XFF02084B).withOpacity(0.1),
                                hintText: "Well, I think...",
                                hintStyle: TextStyle(
                                  color: Color(0XFF02084B).withOpacity(0.3),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                      color:
                                          Color(0XFF02084B).withOpacity(0.2)),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0XFF02084B)),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      )
                    ])));
  }
}
