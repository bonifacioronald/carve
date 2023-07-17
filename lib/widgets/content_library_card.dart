import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../models/colors.dart';

class ContentLibraryCard extends StatelessWidget {
  String contentCategory;
  String contentTitle;
  String contentImageUrl;
  String contentDesc;
  ContentLibraryCard({
    required this.contentCategory,
    required this.contentTitle,
    required this.contentImageUrl,
    required this.contentDesc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      padding: EdgeInsets.zero,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: primaryDarkPurple.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 2,
              offset: const Offset(0, 3),
            )
          ],
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
              image: NetworkImage(contentImageUrl), fit: BoxFit.cover)),
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: NetworkImage(contentImageUrl), fit: BoxFit.cover)),
              height: 200,
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        color: backgroundPurple,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      contentCategory,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: primaryDarkPurple,
                      ),
                    ),
                  ))),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AutoSizeText(
                    contentTitle,
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: primaryDarkPurple,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    contentDesc,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 15,
                      color: primaryDarkPurple,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
