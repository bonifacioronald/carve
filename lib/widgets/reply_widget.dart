import '../widgets/icon_switching.dart';
import 'package:flutter/material.dart';
import '/models/colors.dart' as custom_colors;

class replyCard extends StatelessWidget {
  String authorName;
  String content;
  String publishedDate;

  replyCard(
      {required this.authorName,
      required this.content,
      required this.publishedDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      width: double.infinity,
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
                child: Row(children: [
                  Container(
                    width: 60,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: custom_colors.primaryDarkPurple),
                    // Changed the icons to the user profile
                    child: const Center(
                      child: Icon(
                        Icons.supervised_user_circle,
                        color: Colors.white,
                        size: 36,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                      height: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 68,
                            child: Text(authorName,
                                style: TextStyle(
                                    color: custom_colors.primaryDarkPurple
                                        .withOpacity(0.4),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                                overflow: TextOverflow.ellipsis),
                          ),
                          Text(publishedDate,
                              style: TextStyle(
                                  color: custom_colors.primaryDarkPurple
                                      .withOpacity(0.4),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                              overflow: TextOverflow.ellipsis),
                        ],
                      )),
                  const SizedBox(width: 120),
                  // Bookmark icon
                  iconSwitching(
                    Icons.bookmark_border,
                    Icons.bookmark,
                    40,
                    custom_colors.primaryDarkPurple,
                  ),
                ]),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
          ),
          Text(
            content,
            style: TextStyle(
                color: custom_colors.primaryDarkPurple,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
