import 'package:carve_app/models/video_model.dart';
import 'package:carve_app/providers/video_provider.dart';
import 'package:carve_app/widgets/video_course_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/colors.dart' as custom_colors;

class MainMenuVideoCourseSection extends StatelessWidget {
  const MainMenuVideoCourseSection({super.key});

  @override
  Widget build(BuildContext context) {
    List<VideoModel> loadedVideoList =
        Provider.of<VideoProvider>(context, listen: false).loadedVideoList;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Video Materials',
          style: TextStyle(
              fontSize: 20,
              color: custom_colors.primaryDarkPurple,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          width: double.infinity,
          height: loadedVideoList.length * 140 + loadedVideoList.length * 16,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: loadedVideoList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  VideoCourseCard(
                      thumbnailUrl: loadedVideoList[index].thumbnailUrl,
                      videoUrl: loadedVideoList[index].id,
                      rating: loadedVideoList[index].rating,
                      title: loadedVideoList[index].title,
                      authorName: loadedVideoList[index].authorName),
                  SizedBox(
                    height: 16,
                  ),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
