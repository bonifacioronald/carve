import 'package:carve_app/widgets/category_button.dart';
import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;
import '../navigation.dart';

class MainMenuCategorySection extends StatelessWidget {
  const MainMenuCategorySection({super.key});

  BottomNavigationBar get navigationBar {
    return NavigationState.globalKey.currentWidget as BottomNavigationBar;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Your Resources',
              style: TextStyle(
                  fontSize: 20,
                  color: custom_colors.primaryDarkPurple,
                  fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: (() => navigationBar.onTap!(1)),
              child: Container(
                child: Text(
                  'See All',
                  style: TextStyle(
                      fontSize: 14,
                      color: custom_colors.secondaryLightPurple,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CategoryButton(
                custom_colors.primaryDarkPurple,
                Colors.white,
                Icons.food_bank_outlined,
                "Food",
              ),
              CategoryButton(
                custom_colors.primaryDarkPurple.withOpacity(0.7),
                Colors.white,
                Icons.read_more,
                "Read",
              ),
              CategoryButton(
                  custom_colors.secondaryLightPurple.withOpacity(0.6),
                  Colors.white,
                  Icons.read_more,
                  "Read"),
              CategoryButton(
                custom_colors.secondaryLightPurple,
                Colors.white,
                Icons.read_more,
                "Read",
              ),
            ],
          ),
        )
      ],
    );
  }
}
