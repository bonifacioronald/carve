import 'package:carve_app/screens/daily_content_screen.dart';
import 'package:carve_app/screens/resource_categories_screen.dart';
import 'package:carve_app/widgets/category_button.dart';
import 'package:provider/provider.dart';
import '../providers/resource_provider.dart';
import 'local_parenting_class_screen.dart';
import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;
import 'package:url_launcher/url_launcher.dart';

class ResourcesScreen extends StatefulWidget {
    
    ResourcesScreen({super.key});

  @override
  
  State<ResourcesScreen> createState() => _ResourcesScreenState();
}

class _ResourcesScreenState extends State<ResourcesScreen> {
  bool _isLoading = true;
  void initState() {
    var _provider = Provider.of<ResourceProvider>(context, listen: false);
    _provider.fetchResourceId().then(
      (_) {
        print('Successfuly fetched ${_provider.resourceIdList.length} ids');
        _provider.fetchAllResourceData().then(
          (_) {
            setState(
              () {
                _isLoading = false;
              },
            );
          },
        );
      },
    );

    super.initState();
  }
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
                    top: MediaQuery.of(context).padding.top + 40),
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
                    Icon(
                      Icons.search,
                      size: 28,
                      color: custom_colors.primaryDarkPurple,
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
                    ResourcesMainCard('Attend Local \nPregnancy Class'),
                    SizedBox(
                      width: 20,
                    ),
                    ResourcesMainCard('Attend Local \nTherapy'),
                    SizedBox(
                      width: 20,
                    ),
                    ResourcesMainCard('Check Out \nLocal Food Bank'),
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
                        Text(
                          'See All',
                          style: TextStyle(
                              fontSize: 14,
                              color: custom_colors.secondaryLightPurple,
                              fontWeight: FontWeight.bold),
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
                          GestureDetector(
                            onTap: () => 
                            
                            Navigator.of(context)
                            .pushNamed(ResourceCategories.routeName),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CategoryButton(
                                  custom_colors.primaryDarkPurple,
                                  Colors.white,
                                  Icons.baby_changing_station_rounded,
                                  "Post-\npartum",
                                ),
                                CategoryButton(
                                    custom_colors.primaryDarkPurple
                                        .withOpacity(0.7),
                                    Colors.white,
                                    Icons.handshake_rounded,
                                    "Therapy"),
                                CategoryButton(
                                  custom_colors.secondaryLightPurple
                                      .withOpacity(0.6),
                                  Colors.white,
                                  Icons.phone_in_talk_sharp,
                                  "Marriage\nCounseling",
                                ),
                                CategoryButton(
                                  custom_colors.secondaryLightPurple,
                                  Colors.white,
                                  Icons.school_outlined,
                                  "Daycare",
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context)
                                .pushNamed(ResourceCategories.routeName),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CategoryButton(
                                  custom_colors.secondaryLightPurple,
                                  Colors.white,
                                  Icons.payments_outlined,
                                  "Charities",
                                ),
                                CategoryButton(
                                  custom_colors.secondaryLightPurple
                                      .withOpacity(0.6),
                                  Colors.white,
                                  Icons.food_bank_outlined,
                                  "Food Bank",
                                ),
                                CategoryButton(
                                  custom_colors.primaryDarkPurple
                                      .withOpacity(0.7),
                                  Colors.white,
                                  Icons.house_outlined,
                                  "Adoption\nAgency",
                                ),
                                CategoryButton(
                                  custom_colors.primaryDarkPurple,
                                  Colors.white,
                                  Icons.stroller_outlined,
                                  "Babysitter",
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
                      "Recommended for you",
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
  ResourcesMainCard(this.text);
  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width - 80,
      height: 160,
      padding: EdgeInsets.only(top: 20, left: 15, bottom: 25, right: 10),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/assets/images/daily_content_card_bg.png'),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 2),
                height: 60,
                width: 187,
                child: Column(children: [
                  Text(
                    text,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  )
                ]),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context)
                        .pushNamed(ResourceCategories.routeName),
                    child: Container(
                      width: 151,
                      height: 40,
                      padding: EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                          color: Color(0xFF02084B),
                          borderRadius: BorderRadiusDirectional.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text("Book Now",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              SizedBox(
                                width: 13,
                              ),
                              Icon(Icons.room_service_outlined,
                                  color: Colors.white)
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),

          // second container
        ],
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
    return Container(
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
    );
  }
}

class PregnantDietConsultationBox extends StatelessWidget {
  const PregnantDietConsultationBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
