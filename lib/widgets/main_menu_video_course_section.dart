import 'package:carve_app/models/video_model.dart';
import 'package:carve_app/providers/user_provider.dart';
import 'package:carve_app/providers/video_provider.dart';
import 'package:carve_app/widgets/video_course_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/colors.dart' as custom_colors;

class MainMenuVideoCourseSection extends StatelessWidget {
  const MainMenuVideoCourseSection({super.key});

  @override
  Widget build(BuildContext context) {
    var _userProvider = Provider.of<UserProvider>(context, listen: false);
    List<VideoModel> loadedVideoList =
        Provider.of<VideoProvider>(context, listen: false).loadedVideoList;
    List<VideoModel> loadedVideoFilteredIsForPregancyList =
        _userProvider.userProviderData.isPregnant
            ? loadedVideoList
                .where((video) => video.isForPregnancy == true)
                .toList()
            : loadedVideoList
                .where((video) => video.isForPregnancy == false)
                .toList();
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
          height: 20,
        ),
        Container(
          width: double.infinity,
          height: loadedVideoFilteredIsForPregancyList.length * 140 +
              loadedVideoFilteredIsForPregancyList.length * 16,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: loadedVideoFilteredIsForPregancyList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  VideoCourseCard(
                      thumbnailUrl: loadedVideoFilteredIsForPregancyList[index]
                          .thumbnailUrl,
                      videoUrl: loadedVideoFilteredIsForPregancyList[index].id,
                      rating:
                          loadedVideoFilteredIsForPregancyList[index].rating,
                      title: loadedVideoFilteredIsForPregancyList[index].title,
                      authorName: loadedVideoFilteredIsForPregancyList[index]
                          .authorName),
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
