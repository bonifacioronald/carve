import 'package:carve_app/models/colors.dart';
import 'package:carve_app/screens/resources_screen.dart';
import 'package:flutter/material.dart';

import 'package:carve_app/widgets/to_buy_lists.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPurple,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 60,
              top: MediaQuery.of(context).padding.top + 20),
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Discover",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: primaryDarkPurple)),
            SizedBox(height: 20),
            Row(children: [
              Text("Resources",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: primaryDarkPurple)),
              Spacer(),
              GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushNamed(ResourcesScreen.routeName),
                child: Container(
                  child: Text(
                    'see more>>',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: primaryDarkPurple),
                  ),
                ),
              ),
            ]),
            SizedBox(height: 20),
            Container(
              child: SingleChildScrollView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ResourcesMainCard(
                        '15% OFF Pregnancy Care',
                        'https://images.ctfassets.net/9wtva4vhlgxb/6QWEHMlC0gSnCAdZVYJuvJ/321f0c3ae02c30b4cf45cc7ec6037559/mask_3x.webp',
                        'Pregnancy Classes'),
                    SizedBox(
                      width: 20,
                    ),
                    ResourcesMainCard(
                        'Best Family Therapy in Town',
                        'https://www.arkansasrelationshipcenter.com/wp-content/uploads/2019/02/Family-therapy-family-counseling-little-rock-common-family-therapy-issues-1080x675.jpg',
                        'Therapy'),
                    SizedBox(
                      width: 20,
                    ),
                    ResourcesMainCard(
                        'Hunger Relief Near You',
                        'https://assets.hmetro.com.my/images/articles/food_1585123849.jpg',
                        'Food Bank'),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ), //resources cards
            SizedBox(height: 20),
            Row(children: [
              Text("Planning Tools",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: primaryDarkPurple)),
              Spacer(),
              GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushNamed(ResourcesScreen.routeName),
                child: Container(
                  child: Text(
                    'see more>>',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: primaryDarkPurple),
                  ),
                ),
              ),
            ]), //planning tools texts
            Shopping(),
            Container(
              child: Text(
                'Articles',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: primaryDarkPurple),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
