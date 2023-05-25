import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../models/colors.dart';

class ContentLibraryCard extends StatelessWidget {
  String contentCategory;
  String contentTitle;
  String contentImageUrl;
  ContentLibraryCard({
    required this.contentCategory,
    required this.contentTitle,
    required this.contentImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 300,
        padding: EdgeInsets.zero,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
                image: NetworkImage(contentImageUrl), fit: BoxFit.cover)),
        child: Column(children: [
          Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: NetworkImage(contentImageUrl), fit: BoxFit.cover)),
              height: 240,
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        color: backgroundPurple,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      contentCategory,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: primaryDarkPurple,
                      ),
                    ),
                  ))),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              color: Colors.white,
              child: Align(
                alignment: Alignment.centerLeft,
                child: AutoSizeText(
                  contentTitle,
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: primaryDarkPurple,
                  ),
                ),
              ),
            ),
          ),
        ]));
  }
}
