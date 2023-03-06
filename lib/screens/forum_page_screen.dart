import 'package:carve_app/widgets/forum_content_page_card.dart';
import 'package:carve_app/widgets/reply_button.dart';
import 'package:carve_app/widgets/reply_widget.dart';
import 'package:flutter/material.dart';
import '/models/colors.dart' as custom_colors;

class forumPage extends StatelessWidget {
  const forumPage({super.key});

  @override
  Widget build(BuildContext context) {
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
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(children: [
                    forumContentCard(
                      "Benjamin",
                      "1h ago",
                      "Is it considered rude to ask who the father is when a woman announces her pregnancy?",
                      "I'm curious about this topic and wondering about the social norms and etiquette surrounding such a question. While some people might see it as a legitimate inquiry or simply being curious, others might find it invasive or inappropriate. I'm interested in hearing different perspectives on this issue and learning more about how people approach this kind of situation.",
                      "Makan",
                      120,
                    ),
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
                    replyCard(
                        "Benjamin",
                        "1h ago",
                        "Is it considered rude to ask who the father is when a woman announces her pregnancy?",
                        120),
                    SizedBox(height: 16),
                    ReplyButton(),
                  ])
                ])));
  }
}
