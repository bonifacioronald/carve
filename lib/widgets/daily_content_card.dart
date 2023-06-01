import '../providers/user_provider.dart';
import '../screens/daily_content_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/colors.dart' as custom_colors;

class DailyContentCard extends StatelessWidget {
  const DailyContentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('lib/assets/images/daily_content_card_bg.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: custom_colors.primaryDarkPurple.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Your Daily Content\nIs Waiting!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context)
                    .pushNamed(DailyContentScreen.routeName),
                child: Container(
                  width: 140,
                  height: 40,
                  decoration: BoxDecoration(
                      color: custom_colors.primaryDarkPurple,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Access Now',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.play_circle_outline_rounded,
                        color: custom_colors.backgroundPurple,
                        size: 28,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          const Spacer(),
          Container(
            width: 120,
            height: double.infinity,
            child: Image.asset(
              Provider.of<UserProvider>(context, listen: false)
                      .userProviderData
                      .isPregnant
                  ? 'lib/assets/images/Pregnancy 4.png'
                  : 'lib/assets/images/family_image.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
