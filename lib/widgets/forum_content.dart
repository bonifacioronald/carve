import 'package:auto_size_text/auto_size_text.dart';
import 'package:carve_app/screens/create_forum_screen.dart';
import 'package:carve_app/screens/forum_page_screen.dart';
import 'package:flutter/material.dart';

class ForumCard extends StatelessWidget {
  // username make it dynamic based on the username
  String username;
  String time;
  String category;
  String title;
  String like;
  String comments;

  ForumCard(this.username, this.time, this.category, this.title, this.like,
      this.comments);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Container(
          width: 352,
          height: 192,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 3))
              ]),
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 8, top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AutoSizeText(
                      username,
                      style: TextStyle(
                          color: Color(0XFF000000).withOpacity(0.4),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis,
                      minFontSize: 16,
                      maxFontSize: 16,
                      maxLines: 1,
                    ),
                    Icon(Icons.circle_rounded,
                        color: Color(0XFF000000).withOpacity(0.5), size: 4),
                    Text(time,
                        style: TextStyle(
                            color: Color(0XFF000000).withOpacity(0.4),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis),
                    SizedBox(width: 4),
                    Container(
                        width: 92,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Color(0XFF8E93FB).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(category,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600)),
                        )),
                    SizedBox(width: 8),
                    Icon(Icons.bookmark_add_outlined,
                        color: Color(0XFF5B5B5B5B).withOpacity(0.5), size: 28),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 8),
                child: Text(title,
                    style: TextStyle(
                        color: Color(0XFF02084B),
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
              ),
              Divider(
                color: Color(0XFF02084B).withOpacity(0.1),
                indent: 8,
                thickness: 2,
                endIndent: 12,
              ),
              Container(
                  padding: EdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      Icon(Icons.thumb_up_alt_outlined,
                          color: Color(0XFF5B5B5B5B).withOpacity(0.5),
                          size: 24),
                      Text(like,
                          style: TextStyle(
                              color: Color(0XFF5B5B5B5B).withOpacity(0.5),
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                      SizedBox(width: 16),
                      Icon(Icons.comment_outlined,
                          color: Color(0XFF5B5B5B5B).withOpacity(0.5),
                          size: 24),
                      SizedBox(width: 4),
                      Text(comments,
                          style: TextStyle(
                              color: Color(0XFF5B5B5B5B).withOpacity(0.5),
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                      SizedBox(width: 75),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0XFFFFFFFF)),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => forumPage()));
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
                  ))
            ],
          )),
    );
  }

  createForums() {}
}
