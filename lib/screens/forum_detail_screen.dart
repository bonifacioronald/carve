import 'package:carve_app/models/forum_model.dart';
import 'package:carve_app/providers/forum_provider.dart';
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
  @override
  Widget build(BuildContext context) {
    ForumModel displayedContent =
        ModalRoute.of(context)!.settings.arguments as ForumModel;
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
                        height: 106 * 3,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                replyCard(
                                    "Benjamin",
                                    "1h ago",
                                    "Is it considered rude to ask who the father is when a woman announces her pregnancy?",
                                    120),
                                SizedBox(height: 16),
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 16),
                      ReplyButton(),
                    ]),
                  )
                ])));
  }
}
