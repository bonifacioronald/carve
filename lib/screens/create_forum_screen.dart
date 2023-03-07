import 'dart:io';
import 'package:carve_app/widgets/add_image.dart';
import 'package:carve_app/widgets/category_button.dart';
import 'package:carve_app/widgets/create_button.dart';
import 'package:carve_app/widgets/forum_create_page_description.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class createForum extends StatefulWidget {
  static const routeName = '/create-forum';

  @override
  State<createForum> createState() => _createForumState();
}

class _createForumState extends State<createForum> {
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
    return Scaffold(
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
          padding: EdgeInsets.only(left: 24, right: 24),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CategoryButton(
                    Colors.white,
                    Color(0XFFFF8684),
                    Icons.pregnant_woman,
                    "Pregnancy",
                  ),
                  CategoryButton(
                    Colors.white,
                    Color(0XFFFF8684),
                    Icons.pregnant_woman,
                    "Pregnancy",
                  ),
                  CategoryButton(
                    Colors.white,
                    Color(0XFFFF8684),
                    Icons.pregnant_woman,
                    "Pregnancy",
                  ),
                  CategoryButton(
                    Colors.white,
                    Color(0XFFFF8684),
                    Icons.pregnant_woman,
                    "Pregnancy",
                  ),
                ],
              ),
              SizedBox(height: 28),
              Text("Description",
                  style: TextStyle(
                      color: Color(0XFF02084B),
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Container(height: 120, child: descriptionForum()),
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
              createButton("Publish Forum")
            ],
          )),
    );
  }
}
