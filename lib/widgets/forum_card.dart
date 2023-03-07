import 'package:auto_size_text/auto_size_text.dart';
import 'package:carve_app/screens/forum_detail_screen.dart';
import 'package:flutter/material.dart';
import '/models/colors.dart' as custom_colors;
import 'package:intl/intl.dart';

class ForumCard extends StatelessWidget {
  String authorName;
  DateTime publishedDate;
  String category;
  String title;
  int totalLikes;
  int totalReplies;

  ForumCard({
    required this.authorName,
    required this.publishedDate,
    required this.category,
    required this.title,
    required this.totalLikes,
    required this.totalReplies,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AutoSizeText(
                '$authorName •',
                style: TextStyle(
                  color: Colors.grey.withOpacity(0.4),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
                minFontSize: 16,
                maxFontSize: 16,
                maxLines: 1,
              ),
              SizedBox(width: 4),
              Text(
                DateFormat('MMM dd').format(publishedDate).toString(),
                style: TextStyle(
                  color: Colors.grey.withOpacity(0.4),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: custom_colors.secondaryLightPurple.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    category.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Icon(Icons.bookmark_add_outlined,
                  color: Colors.grey.withOpacity(0.5), size: 28),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: TextStyle(
              color: custom_colors.primaryDarkPurple,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Divider(
            color: Color(0XFF02084B).withOpacity(0.1),
            thickness: 2,
          ),
          Row(
            children: [
              Icon(Icons.thumb_up_alt_outlined,
                  color: Color(0XFF5B5B5B5B).withOpacity(0.5), size: 24),
              SizedBox(
                width: 4,
              ),
              Text(totalLikes.toString(),
                  style: TextStyle(
                      color: Color(0XFF5B5B5B5B).withOpacity(0.5),
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
              SizedBox(width: 16),
              Icon(Icons.comment_outlined,
                  color: Color(0XFF5B5B5B5B).withOpacity(0.5), size: 24),
              SizedBox(width: 4),
              Text(totalReplies.toString(),
                  style: TextStyle(
                      color: Color(0XFF5B5B5B5B).withOpacity(0.5),
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
              Spacer(),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0XFFFFFFFF)),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => forumPage()));
                },
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: Text("Read more >",
                      style: TextStyle(
                          color: Color(0XFF02084B),
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
