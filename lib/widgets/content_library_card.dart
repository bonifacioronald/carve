import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;

class ContentLibraryCard extends StatelessWidget {
  String contentCategory;
  String contentTitle;
  String contentImageUrl;
  ContentLibraryCard(
      {required this.contentCategory,
      required this.contentTitle,
      required this.contentImageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 220,
        child: Column(
          children: [
            Container(
              width: 100,
              height: 144,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.amber,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 100,
              height: 20,
              decoration: BoxDecoration(
                  color: custom_colors.primaryDarkPurple,
                  borderRadius: BorderRadius.circular(4)),
              child: Center(
                child: Text(
                  contentCategory,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ),
            ),
            Container(
              width: 100,
              height: 30,
              decoration: BoxDecoration(),
              child: Center(
                child: AutoSizeText(
                  contentTitle,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  maxLines: 4,
                  minFontSize: 12,
                  style: TextStyle(
                      color: custom_colors.primaryDarkPurple,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ));
  }
}
