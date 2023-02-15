import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Search for content...',
            style: TextStyle(
                fontSize: 14,
                color: custom_colors.primaryDarkPurple.withOpacity(0.5),
                fontWeight: FontWeight.bold),
          ),
          Icon(
            Icons.search,
            color: custom_colors.primaryDarkPurple,
          )
        ],
      )),
    );
  }
}
