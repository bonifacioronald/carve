import 'package:carve_app/widgets/video_course_card.dart';
import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;

class MainMenuVideoCourseSection extends StatelessWidget {
  const MainMenuVideoCourseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Video Courses',
              style: TextStyle(
                  fontSize: 20,
                  color: custom_colors.primaryDarkPurple,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'See All',
              style: TextStyle(
                  fontSize: 14,
                  color: custom_colors.secondaryLightPurple,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        VideoCourseCard(
          rating: 4.7,
          title: "Building A Healthy Routine",
          authorName: "Bonifacio Ronald",
          imageUrl: "",
        ),
        SizedBox(
          height: 16,
        ),
        VideoCourseCard(
          rating: 4.7,
          title: "Building A Healthy Routine",
          authorName: "Bonifacio Ronald",
          imageUrl: "",
        ),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
