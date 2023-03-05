import 'package:carve_app/screens/forum_all.dart';
import 'package:carve_app/widgets/icon_switching.dart';
import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;
import 'package:carve_app/widgets/create_button.dart';
import 'package:carve_app/widgets/forum_content.dart';

class ForumScreen extends StatelessWidget {
  const ForumScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 16, left: 24),
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
              SizedBox(height: 24),
              // Create forum button
              createButton("Create Forum"),
              SizedBox(height: 16),
              Divider(
                color: Color(0XFF02084B).withOpacity(0.1),
                thickness: 2,
                endIndent: 20,
              ),
              SizedBox(height: 16),
              Container(
                  padding: EdgeInsets.only(right: 20),
                  child: Row(
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
                  )),
              // Container Forum Cards
              Container(
                  padding: EdgeInsets.only(top: 8, right: 24, bottom: 4),
                  child: Column(children: [
                    ForumCard(
                        "Benjamin Lim",
                        "12h ago",
                        "Pregnancy",
                        "Is it considered rude to ask who the father is when a woman announces her pregnancy?",
                        "120",
                        "60"),
                    ForumCard(
                        "Hans",
                        "1w ago",
                        "Growth",
                        "6 ways to soothe your crying baby in public",
                        "200",
                        "160"),
                    ForumCard("Dylan Eu", "2w ago", "Nutrition",
                        "Which Baby Product is the best?", "153", "78"),
                  ]))
            ],
          ),
        ));
  }
}
