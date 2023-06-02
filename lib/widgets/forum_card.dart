import 'package:flutter/material.dart';
import '/models/colors.dart' as custom_colors;
import 'package:intl/intl.dart';
import '../widgets/icon_switching.dart';

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
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 60,
                child: Text(
                  '$authorName •',
                  style: TextStyle(
                    color: Colors.grey.withOpacity(0.4),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                DateFormat('MMM dd').format(publishedDate).toString(),
                style: TextStyle(
                  color: Colors.grey.withOpacity(0.4),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: custom_colors.secondaryLightPurple.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    category.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const iconSwitching(
                  Icons.bookmark_add_outlined, Icons.bookmark, 28, Colors.grey),
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: 60,
            child: Text(title,
                style: TextStyle(
                  color: custom_colors.primaryDarkPurple,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis),
          ),
          Divider(
            color: custom_colors.primaryDarkPurple.withOpacity(0.1),
            thickness: 2,
          ),
          Row(
            children: [
              iconSwitching(Icons.thumb_up_alt_outlined, Icons.thumb_up, 24,
                  const Color(0XFF5B5B5B5B).withOpacity(0.5)),
              const SizedBox(
                width: 4,
              ),
              Text(totalLikes.toString(),
                  style: TextStyle(
                      color: const Color(0XFF5B5B5B5B).withOpacity(0.5),
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
              const SizedBox(width: 16),
              iconSwitching(Icons.comment_outlined, Icons.comment, 24,
                  const Color(0XFF5B5B5B5B).withOpacity(0.5)),
              const SizedBox(width: 4),
              Text(totalReplies.toString(),
                  style: TextStyle(
                      color: const Color(0XFF5B5B5B5B).withOpacity(0.5),
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
              const Spacer(),
              Container(
                alignment: Alignment.bottomRight,
                child: Text("Read more >",
                    style: TextStyle(
                        color: custom_colors.primaryDarkPurple,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
