import 'package:carve_app/widgets/icon_switching.dart';
import 'package:flutter/material.dart';
import '/models/colors.dart' as custom_colors;

class replyCard extends StatelessWidget {
  String username;
  String time;
  String content;
  int likes;
  replyCard(this.username, this.time, this.content, this.likes, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        width: 348,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: custom_colors.primaryDarkPurple),
                          // Changed the icons to the user profile
                          child: Center(
                            child: Icon(
                              Icons.supervised_user_circle,
                              color: Colors.white,
                              size: 36,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                            height: 40,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(username,
                                    style: TextStyle(
                                        color:
                                            Color(0XFF000000).withOpacity(0.4),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                    overflow: TextOverflow.ellipsis),
                                Text(time,
                                    style: TextStyle(
                                        color:
                                            Color(0XFF000000).withOpacity(0.4),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                    overflow: TextOverflow.ellipsis),
                              ],
                            )),
                        SizedBox(width: 140),
                        Container(
                          alignment: Alignment.topRight,
                          child: iconSwitching(
                              Icons.bookmark_border,
                              Icons.bookmark,
                              40,
                              custom_colors.primaryDarkPurple),
                        )
                      ]),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
            ),
            Text(
              content,
              style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Container(
                    child: Row(
                  children: [
                    Icon(Icons.thumb_up_alt_outlined,
                        color: Color(0XFF5B5B5B5B).withOpacity(0.5), size: 24),
                    Text("$likes",
                        style: TextStyle(
                            color: Color(0XFF5B5B5B5B).withOpacity(0.5),
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                    SizedBox(width: 220),
                    Icon(Icons.more_vert),
                  ],
                )),
              ],
            )
          ],
        ));
  }
}