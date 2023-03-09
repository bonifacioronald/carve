import 'dart:io';
import 'package:carve_app/models/user_model.dart';
import 'package:carve_app/providers/user_provider.dart';
import 'package:carve_app/screens/forum_all_screen.dart';
import 'package:carve_app/screens/forum_home_screen.dart';
import 'package:carve_app/widgets/add_image.dart';
import 'package:carve_app/widgets/category_button.dart';
import 'package:carve_app/widgets/create_button.dart';
import 'package:carve_app/widgets/forum_create_page_description.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '/models/colors.dart' as custom_colors;

class createForum extends StatefulWidget {
  static const routeName = '/create-forum';

  @override
  State<createForum> createState() => _createForumState();
}

class _createForumState extends State<createForum> {
  var _counterText = "";
  Future<void>? createNewForum(String authorName, String category,
      String content, DateTime publishedDate, String title) {
    FirebaseFirestore.instance.collection('forum').doc().set({
      "authorName": authorName,
      "category": category,
      "content": content,
      'id': '',
      'publishedDate': publishedDate,
      'title': title,
      'totalLikes': 0,
      'totalReplies': 0,
    });
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  int currentCLickIndex = 0;
  String title = '';
  String description = '';
  String Category = '';

  // Color defaultColor = Colors.white;
  File? image;
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  // void _updateCategory(int currentCLickIndex, BuildContext context) {
  //   switch (currentCLickIndex) {
  //     case 1:
  //       {
  //         Category = 'Pregnancy';
  //       }
  //       break;
  //     case 2:
  //       {
  //         Category = 'Growth';
  //       }
  //       break;
  //     case 3:
  //       {
  //         Category = 'Nutrition';
  //       }
  //       break;
  //     case 4:
  //       {
  //         Category = 'Education';
  //       }
  //       break;
  //     case 5:
  //       {
  //         Category = 'Financial';
  //       }
  //       break;
  //     case 6:
  //       {
  //         Category = 'Others';
  //       }
  //       break;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    UserModel currentUser =
        Provider.of<UserProvider>(context, listen: false).userProviderData;
    return Scaffold(
      backgroundColor: custom_colors.backgroundPurple,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Color(0XE8E9FE),
          elevation: 0,
          leading: IconButton(
            padding: EdgeInsets.only(left: 8),
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_new,
                size: 32, color: Color(0XFF02084B)),
          )),
      body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 24, right: 24, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Create a Forum",
                      style: TextStyle(
                          color: Color(0XFF02084B),
                          fontSize: 32,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 28),
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0XFFFFFFFF),
                  hintText: "Forum Title",
                  hintStyle: TextStyle(
                      color: Color(0XFF02084B).withOpacity(0.3),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: Color(0XFF02084B).withOpacity(0.2))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFF02084B))),
                ),
              ),
              SizedBox(height: 28),
              Text("Categories",
                  style: TextStyle(
                      color: Color(0XFF02084B),
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentCLickIndex = 1;
                          Category = "Pregnancy";
                          print(Category);
                        });
                        // _updateCategory(currentCLickIndex, context);
                      },
                      child: CategoryButton(
                          currentCLickIndex == 1
                              ? custom_colors.primaryDarkPurple
                              : Colors.white,
                          currentCLickIndex == 1
                              ? Colors.white
                              : custom_colors.primaryDarkPurple,
                          Icons.pregnant_woman,
                          "Pregnancy"),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentCLickIndex = 2;
                          Category = "Growth";
                          print(Category);
                        });
                      },
                      child: CategoryButton(
                          currentCLickIndex == 2
                              ? custom_colors.primaryDarkPurple
                              : Colors.white,
                          currentCLickIndex == 2
                              ? Colors.white
                              : custom_colors.primaryDarkPurple,
                          Icons.child_care_rounded,
                          "Growth"),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentCLickIndex = 3;
                          Category = "Nutrition";
                          print(Category);
                        });
                      },
                      child: CategoryButton(
                          currentCLickIndex == 3
                              ? custom_colors.primaryDarkPurple
                              : Colors.white,
                          currentCLickIndex == 3
                              ? Colors.white
                              : custom_colors.primaryDarkPurple,
                          Icons.restaurant,
                          "Nutrition"),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentCLickIndex = 4;
                          Category = "Education";
                          print(Category);
                        });
                      },
                      child: CategoryButton(
                          currentCLickIndex == 4
                              ? custom_colors.primaryDarkPurple
                              : Colors.white,
                          currentCLickIndex == 4
                              ? Colors.white
                              : custom_colors.primaryDarkPurple,
                          Icons.school,
                          "Education"),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentCLickIndex = 5;
                          Category = "Financial";
                          print(Category);
                        });
                      },
                      child: CategoryButton(
                          currentCLickIndex == 5
                              ? custom_colors.primaryDarkPurple
                              : Colors.white,
                          currentCLickIndex == 5
                              ? Colors.white
                              : custom_colors.primaryDarkPurple,
                          Icons.attach_money,
                          "Financial"),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentCLickIndex = 6;
                          Category = "Others";
                          print(Category);
                        });
                      },
                      child: CategoryButton(
                          currentCLickIndex == 6
                              ? custom_colors.primaryDarkPurple
                              : Colors.white,
                          currentCLickIndex == 6
                              ? Colors.white
                              : custom_colors.primaryDarkPurple,
                          Icons.drag_indicator_sharp,
                          "Others"),
                    ),
                    SizedBox(width: 20),
                  ])),
              SizedBox(height: 28),
              Text("Description",
                  style: TextStyle(
                      color: Color(0XFF02084B),
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Container(
                  height: 120,
                  child: Container(
                      height: 5 * 24.0,
                      child: TextField(
                        controller: _descriptionController,
                        textInputAction: TextInputAction.go,
                        // expands: true,
                        maxLines: 5,
                        onChanged: (value) {
                          setState(() {
                            _counterText = (100 - value.length).toString();
                          });
                        },
                        maxLength: 100,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0XFFFFFFFF),
                          hintText: "Description",
                          hintStyle: TextStyle(
                              color: Color(0XFF02084B).withOpacity(0.3),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                  color: Color(0XFF02084B).withOpacity(0.2))),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0XFF02084B))),
                        ),
                      ))),
              SizedBox(height: 8),
              Text("Add Media",
                  style: TextStyle(
                      color: Color(0XFF02084B),
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              Container(
                height: 82,
                child: Row(
                  children: [
                    inputButton("Pick from Gallery", Icons.photo_album_rounded,
                        () => pickImage(ImageSource.gallery)),
                    SizedBox(width: 8),
                    inputButton("Take a Photo", Icons.camera_alt_rounded,
                        () => pickImage(ImageSource.camera)),
                  ],
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  createNewForum(
                      currentUser.name,
                      Category,
                      _descriptionController.text,
                      DateTime.now(),
                      _titleController.text);
                  Navigator.of(context).pushNamed(forumAll.routeName);
                  print(currentUser.name);
                  print(_titleController.text);
                  print(_descriptionController.text);
                  print(Category);
                },
                child: Container(
                  width: 352,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0XFF02084B),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                      child: Text("Publish Forum",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold))),
                ),
              ),
            ],
          )),
    );
  }
}
