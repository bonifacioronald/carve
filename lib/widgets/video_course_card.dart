import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/colors.dart' as custom_colors;

class VideoCourseCard extends StatelessWidget {
  String videoUrl;
  double rating;
  String title;
  String authorName;
  String thumbnailUrl;

  VideoCourseCard(
      {required this.videoUrl,
      required this.rating,
      required this.title,
      required this.authorName,
      required this.thumbnailUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        launch(videoUrl);
      }),
      child: Container(
        padding: EdgeInsets.all(12),
        width: double.infinity,
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              height: 116,
              width: 116,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(thumbnailUrl, fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 16,
                        color: custom_colors.secondaryLightPurple,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        rating.toString(),
                        style: TextStyle(
                            color: custom_colors.primaryDarkPurple,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: TextStyle(
                        color: custom_colors.primaryDarkPurple,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "By $authorName",
                        style: TextStyle(
                            color: custom_colors.primaryDarkPurple
                                .withOpacity(0.5),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.play_circle_filled_rounded,
                        color: custom_colors.primaryDarkPurple,
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
