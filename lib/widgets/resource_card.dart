import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/colors.dart' as custom_colors;

class ResourceCard extends StatelessWidget {
  String text;
  String url;

  ResourceCard(this.text, this.url);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => launch(url)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: custom_colors.primaryDarkPurple.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  text,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      color: custom_colors.primaryDarkPurple,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Icon(Icons.keyboard_arrow_right_sharp,
                color: custom_colors.primaryDarkPurple)
          ],
        ),
      ),
    );
  }
}
