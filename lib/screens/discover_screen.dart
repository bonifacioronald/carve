import 'package:carve_app/models/colors.dart';
import 'package:carve_app/screens/shopping_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/resources_main_card.dart';

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
            Text("Resources",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: primaryDarkPurple)),

            SizedBox(height: 20),
            Container(
              child: SingleChildScrollView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ResourcesMainCard(
                        'Pregnancy Classes',
                        'https://images.ctfassets.net/9wtva4vhlgxb/6QWEHMlC0gSnCAdZVYJuvJ/321f0c3ae02c30b4cf45cc7ec6037559/mask_3x.webp',
                        'Pregnancy Classes'),
                    SizedBox(
                      width: 20,
                    ),
                    ResourcesMainCard(
                        'Family Therapy',
                        'https://www.arkansasrelationshipcenter.com/wp-content/uploads/2019/02/Family-therapy-family-counseling-little-rock-common-family-therapy-issues-1080x675.jpg',
                        'Therapy'),
                    SizedBox(
                      width: 20,
                    ),
                    ResourcesMainCard(
                        'Food Bank',
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
                    Navigator.of(context).pushNamed(ShoppingScreen.routeName),
                child: Container(
                    child: Row(children: [
                  Text(
                    'see more',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: primaryDarkPurple),
                  ),
                  Icon(Icons.keyboard_arrow_right_outlined)
                ])),
              ),
            ]), //planning tools texts
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
