import 'package:carve_app/widgets/icon_switching.dart';
import 'package:flutter/material.dart';
import '/models/colors.dart' as custom_colors;
import 'package:intl/intl.dart';

class forumContentCard extends StatelessWidget {
  String authorName;
  DateTime publishedDate;
  String category;
  String content;
  String title;
  int totalLikes;

  forumContentCard(
      {required this.authorName,
      required this.publishedDate,
      required this.category,
      required this.content,
      required this.title,
      required this.totalLikes});

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
                  // User icon
                  Container(
                    width: 60,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: custom_colors.primaryDarkPurple,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.supervised_user_circle,
                        color: Colors.white,
                        size: 36,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Username
                      Text(
                        '$authorName •',
                        style: TextStyle(
                          color: Color(0XFF000000).withOpacity(0.4),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      // Time
                      Text(
                        DateFormat('MMM dd').format(publishedDate).toString(),
                        style: TextStyle(
                          color: Color(0XFF000000).withOpacity(0.4),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  // Bookmark icon
                  iconSwitching(
                    Icons.bookmark_border,
                    Icons.bookmark,
                    40,
                    custom_colors.primaryDarkPurple,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Title
              Text(
                title,
                style: const TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              // Content with read more link
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: content,
                      style: const TextStyle(
                        color: Color(0XFF000000),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const TextSpan(text: ' '),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Category
                  Container(
                    width: 92,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Color(0XFF8E93FB).withOpacity(0.2),
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
                  // Comment icon and count
                  Row(
                    children: [
                      Icon(
                        Icons.thumb_up_alt_sharp,
                        color: Color(0XFF5B5B5B5B).withOpacity(0.5),
                        size: 24,
                      ),
                      Text(
                        totalLikes.toString(),
                        style: TextStyle(
                          color: Color(0XFF5B5B5B5B).withOpacity(0.5),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ]));
  }
}
