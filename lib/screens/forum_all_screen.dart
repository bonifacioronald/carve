import 'package:carve_app/widgets/forum_card.dart';
import 'package:flutter/material.dart';

import '../widgets/forum_category.dart';

class forumAll extends StatelessWidget {
  static const routeName = '/forum-all';
  const forumAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    padding: EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        Category("All", 7),
                        SizedBox(width: 12),
                        Category("Nutrition", 3)
                      ],
                    )),
                SizedBox(height: 24),
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
