import 'package:carve_app/providers/resource_provider.dart';
import 'package:carve_app/screens/daily_content_screen.dart';
import 'package:carve_app/screens/loading_screen.dart';
import 'package:carve_app/screens/resource_detail_screen.dart';
import 'package:carve_app/widgets/category_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/colors.dart' as custom_colors;
import 'package:url_launcher/url_launcher.dart';

import '../models/colors.dart';
import '../providers/daily_content_provider.dart';

class ResourcesScreen extends StatefulWidget {
  ResourcesScreen({super.key});

  @override
  State<ResourcesScreen> createState() => _ResourcesScreenState();
}

class _ResourcesScreenState extends State<ResourcesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: custom_colors.backgroundPurple,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: MediaQuery.of(context).padding.top + 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nearby Resources",
                      style: TextStyle(
                        color: custom_colors.primaryDarkPurple,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //Local Pregnancy
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    ResourcesMainCard(
                        '15% OFF Pregnancy Care',
                        'https://www.pngmart.com/files/16/Vector-Happy-Pregnant-Woman-Transparent-PNG.png',
                        'Pregnancy Classes'),
                    SizedBox(
                      width: 20,
                    ),
                    ResourcesMainCard(
                        'Best Family Therapy in Town',
                        'https://www.pngmart.com/files/21/Counseling-Transparent-Background.png',
                        'Therapy'),
                    SizedBox(
                      width: 20,
                    ),
                    ResourcesMainCard(
                        'Hunger Relief Near You',
                        'https://cdn-icons-png.flaticon.com/512/1075/1075090.png',
                        'Food Bank'),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Categories',
                          style: TextStyle(
                              fontSize: 20,
                              color: custom_colors.primaryDarkPurple,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    //Local Pregnancy
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
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
                        ],
                      ),

                    SizedBox(
                      height: 16,

                    ),
                    //Categories Buttons
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: (() => Navigator.of(context).pushNamed(
                                    ResourceDetailScreen.routeName,
                                    arguments: 'Pregnancy Classes')),
                                child: CategoryButton(
                                  custom_colors.primaryDarkPurple,
                                  Colors.white,
                                  Icons.baby_changing_station_rounded,
                                  "Post-\npartum",
                                ),
                              ),
                              GestureDetector(
                                onTap: (() => Navigator.of(context).pushNamed(
                                    ResourceDetailScreen.routeName,
                                    arguments: 'Therapy')),
                                child: CategoryButton(
                                    custom_colors.primaryDarkPurple
                                        .withOpacity(0.7),
                                    Colors.white,
                                    Icons.handshake_rounded,
                                    "Therapy"),
                              ),
                              GestureDetector(
                                onTap: (() => Navigator.of(context).pushNamed(
                                    ResourceDetailScreen.routeName,
                                    arguments: 'Marriage Counselling')),
                                child: CategoryButton(
                                  custom_colors.secondaryLightPurple
                                      .withOpacity(0.6),
                                  Colors.white,
                                  Icons.phone_in_talk_sharp,
                                  "Marriage\nCounseling",
                                ),
                              ),
                              GestureDetector(
                                onTap: (() => Navigator.of(context).pushNamed(
                                    ResourceDetailScreen.routeName,
                                    arguments: 'Daycare')),
                                child: CategoryButton(
                                  custom_colors.secondaryLightPurple,
                                  Colors.white,
                                  Icons.school_outlined,
                                  "Daycare",
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context)
                                .pushNamed(ResourceDetailScreen.routeName),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: (() => Navigator.of(context).pushNamed(
                                      ResourceDetailScreen.routeName,
                                      arguments: 'Charities')),
                                  child: CategoryButton(
                                    custom_colors.secondaryLightPurple,
                                    Colors.white,
                                    Icons.payments_outlined,
                                    "Charities",
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (() => Navigator.of(context).pushNamed(
                                      ResourceDetailScreen.routeName,
                                      arguments: 'Food Bank')),
                                  child: CategoryButton(
                                    custom_colors.secondaryLightPurple
                                        .withOpacity(0.6),
                                    Colors.white,
                                    Icons.food_bank_outlined,
                                    "Food Bank",
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (() => Navigator.of(context).pushNamed(
                                      ResourceDetailScreen.routeName,
                                      arguments: 'Adoption Agency')),
                                  child: CategoryButton(
                                    custom_colors.primaryDarkPurple
                                        .withOpacity(0.7),
                                    Colors.white,
                                    Icons.house_outlined,
                                    "Adoption\nAgency",
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (() => Navigator.of(context).pushNamed(
                                      ResourceDetailScreen.routeName,
                                      arguments: 'Daycare')),
                                  child: CategoryButton(
                                    custom_colors.primaryDarkPurple,
                                    Colors.white,
                                    Icons.stroller_outlined,
                                    "Babysitter",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Recommended For You",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: custom_colors.primaryDarkPurple),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    //Recommended For You
                    Container(
                      width: double.infinity,
                      height: 140,
                      child: Row(
                        children: [
                          PregnantDietConsultationBox(),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FreePrenatalCareBox(),
                                  EmergencyHotlineBox(),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
              //categories
            ],
          ),
        ),
      ),
    );
  }
}

class ResourcesMainCard extends StatelessWidget {
  String text;
  String imageURL;
  String launcher;
  ResourcesMainCard(this.text, this.imageURL, this.launcher);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>Navigator.of(context)
            .pushNamed(ResourceDetailScreen.routeName, arguments: 'Pregnancy Classes'),
      child: Container(
        width: MediaQuery.of(context).size.width - 80,
        height: 160,
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 20, left: 15, bottom: 25, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: NetworkImage(imageURL),
                opacity: 0.9,
                fit: BoxFit.cover)),
        child:
        Container(
          width:150,
          padding:EdgeInsets.all(15),
          decoration: BoxDecoration(borderRadius:BorderRadius.circular(20),color:secondaryLightPurple.withOpacity(0.7),),
          child:Text(text, textAlign: TextAlign.center, style:TextStyle(fontWeight:FontWeight.w900,fontSize: 16,color: Colors.white,)))
                
        ),
    );
  }
}

class EmergencyHotlineBox extends StatelessWidget {
  const EmergencyHotlineBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launch('tel:+15999');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: custom_colors.primaryDarkPurple.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        width: double.infinity,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Call 15999\nPregnancy Hotline",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.call,
              size: 32,
              color: custom_colors.secondaryLightPurple,
            )
          ],
        ),
      ),
    );
  }
}

class FreePrenatalCareBox extends StatelessWidget {
  const FreePrenatalCareBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(
            ResourceDetailScreen.routeName,
            arguments: 'Pregnancy Classes'),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: custom_colors.primaryDarkPurple.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 2),
              ),
            ],
          ),
          width: double.infinity,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Find Free\nPrenatal Care",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: custom_colors.primaryDarkPurple),
              ),
              Icon(
                Icons.free_breakfast,
                color: custom_colors.secondaryLightPurple,
                size: 40,
              )
            ],
          ),
        ));
  }
}

class PregnantDietConsultationBox extends StatelessWidget {
  const PregnantDietConsultationBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(
            ResourceDetailScreen.routeName,
            arguments: 'Pregnancy Classes'),
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: custom_colors.primaryDarkPurple.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 2),
              ),
            ],
          ),
          width: 140,
          height: 140,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('lib/assets/images/food_icon.png'),
                          fit: BoxFit.cover),
                    ),
                    height: 80,
                    width: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                ],
              ),
              Text(
                "Pregnant Diet\nConsultation",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: custom_colors.primaryDarkPurple),
              )
            ],
          ),
        ));
  }
}
