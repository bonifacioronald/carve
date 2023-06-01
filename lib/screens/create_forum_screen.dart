import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';
import '../providers/user_provider.dart';
import '../widgets/add_image.dart';
import '../widgets/category_button.dart';
import '/models/colors.dart' as custom_colors;

class createForum extends StatefulWidget {
  static const routeName = '/create-forum';

  @override
  State<createForum> createState() => _createForumState();
}

final _forumAddedSnackBar = SnackBar(
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    padding: const EdgeInsets.all(20),
    backgroundColor: custom_colors.secondaryLightPurple,
    behavior: SnackBarBehavior.floating,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8))),
    content: const Text(
      'Successfuly created a new forum!',
      style: TextStyle(color: Colors.white),
    ));

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

  @override
  Widget build(BuildContext context) {
    UserModel currentUser =
        Provider.of<UserProvider>(context, listen: false).userProviderData;
    return Scaffold(
      backgroundColor: custom_colors.backgroundPurple,
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 20,
              top: MediaQuery.of(context).padding.top + 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: (() => Navigator.of(context).pop()),
                icon: Icon(
                  Icons.keyboard_arrow_left_rounded,
                  size: 40,
                  color: custom_colors.primaryDarkPurple,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Create A Forum',
                style: TextStyle(
                    fontSize: 30,
                    color: custom_colors.primaryDarkPurple,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0XFFFFFFFF),
                  hintText: "Forum Title",
                  hintStyle: TextStyle(
                    color: custom_colors.primaryDarkPurple.withOpacity(0.3),
                    fontSize: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: custom_colors.primaryDarkPurple.withOpacity(0.2),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: custom_colors.primaryDarkPurple),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text("Categories",
                  style: TextStyle(
                      color: custom_colors.primaryDarkPurple,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
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
                              ? custom_colors.secondaryLightPurple
                              : Colors.white,
                          currentCLickIndex == 1
                              ? Colors.white
                              : custom_colors.secondaryLightPurple,
                          Icons.pregnant_woman,
                          "Pregnancy"),
                    ),
                    const SizedBox(width: 20),
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
                              ? custom_colors.secondaryLightPurple
                              : Colors.white,
                          currentCLickIndex == 2
                              ? Colors.white
                              : custom_colors.secondaryLightPurple,
                          Icons.child_care_rounded,
                          "Growth"),
                    ),
                    const SizedBox(width: 20),
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
                              ? custom_colors.secondaryLightPurple
                              : Colors.white,
                          currentCLickIndex == 3
                              ? Colors.white
                              : custom_colors.secondaryLightPurple,
                          Icons.restaurant,
                          "Nutrition"),
                    ),
                    const SizedBox(width: 20),
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
                              ? custom_colors.secondaryLightPurple
                              : Colors.white,
                          currentCLickIndex == 4
                              ? Colors.white
                              : custom_colors.secondaryLightPurple,
                          Icons.school,
                          "Education"),
                    ),
                    const SizedBox(width: 20),
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
                              ? custom_colors.secondaryLightPurple
                              : Colors.white,
                          currentCLickIndex == 5
                              ? Colors.white
                              : custom_colors.secondaryLightPurple,
                          Icons.attach_money,
                          "Financial"),
                    ),
                    const SizedBox(width: 20),
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
                              ? custom_colors.secondaryLightPurple
                              : Colors.white,
                          currentCLickIndex == 6
                              ? Colors.white
                              : custom_colors.secondaryLightPurple,
                          Icons.drag_indicator_sharp,
                          "Others"),
                    ),
                    const SizedBox(width: 20),
                  ])),
              const SizedBox(height: 30),
              Text("Description",
                  style: TextStyle(
                      color: custom_colors.primaryDarkPurple,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
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
                          fillColor: const Color(0XFFFFFFFF),
                          hintText: "Description",
                          hintStyle: TextStyle(
                            color: custom_colors.primaryDarkPurple
                                .withOpacity(0.3),
                            fontSize: 16,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                  color: custom_colors.primaryDarkPurple
                                      .withOpacity(0.2))),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: custom_colors.primaryDarkPurple)),
                        ),
                      ))),
              const SizedBox(height: 8),
              Text("Add Media",
                  style: TextStyle(
                      color: custom_colors.primaryDarkPurple,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: AddImageInputButton(
                        "Pick from Gallery",
                        Icons.photo_album_rounded,
                        () => pickImage(ImageSource.gallery)),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: AddImageInputButton(
                        "Take a Photo",
                        Icons.camera_alt_rounded,
                        () => pickImage(ImageSource.camera)),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  createNewForum(
                      currentUser.name,
                      Category,
                      _descriptionController.text,
                      DateTime.now(),
                      _titleController.text);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(_forumAddedSnackBar);

                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 352,
                  height: 60,
                  decoration: BoxDecoration(
                    color: custom_colors.primaryDarkPurple,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      "Publish Forum",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
