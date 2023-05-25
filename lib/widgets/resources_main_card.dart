import 'package:carve_app/models/colors.dart';
import 'package:flutter/material.dart';

import '../screens/resource_detail_screen.dart';

class ResourcesMainCard extends StatelessWidget {
  String text;
  String imageURL;
  String launcher;
  ResourcesMainCard(this.text, this.imageURL, this.launcher);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(ResourceDetailScreen.routeName, arguments: launcher),
      child: Container(
          clipBehavior: Clip.none,
          width: 210,
          height: 250,
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: NetworkImage(imageURL), opacity: 1, fit: BoxFit.cover),
            boxShadow: [
              BoxShadow(
                color: primaryDarkPurple.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              // gradient: LinearGradient(
              //     begin: Alignment.topCenter,
              //     end: Alignment.bottomCenter,
              //     colors: [
              //       Colors.transparent,
              //     ]),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: secondaryLightPurple.withOpacity(0.7),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
