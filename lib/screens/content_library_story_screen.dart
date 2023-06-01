import "../models/content_model.dart";
import "package:flutter/material.dart";
import '../widgets/daily_content_story.dart';
import '../widgets/toggle_button.dart';
import '../models/colors.dart' as custom_colors;
import 'package:intl/intl.dart';

class ContentLibraryStory extends StatefulWidget {
  const ContentLibraryStory({super.key});
  static const routeName = '/ContentLibraryStory';

  @override
  State<ContentLibraryStory> createState() => _ContentLibraryStoryState();
}

class _ContentLibraryStoryState extends State<ContentLibraryStory> {
  @override
  Widget build(BuildContext context) {
    ContentModel displayedContent =
        ModalRoute.of(context)!.settings.arguments as ContentModel;
    imageCache.clear;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd MMMM yyyy').format(now);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: 1461,
          color: custom_colors.backgroundPurple,
          child: Column(
            children: [
              DailyContentStory(displayedContent),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Column(
                  children: [
                    Container(
                        child: Row(children: [
                      const SizedBox(width: 5),
                    ])),
                    const SizedBox(height: 20, width: 180),
                    Container(
                      padding: const EdgeInsets.only(top: 15, left: 15),
                      height: 90,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: custom_colors.primaryDarkPurple),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Add a note about something you've learnt",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          const SizedBox(height: 15, width: 20),
                          Row(
                            children: [
                              Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    color: custom_colors.secondaryLightPurple,
                                    shape: BoxShape.circle),
                                child: const Center(
                                  child: Icon(
                                    Icons.note_add_rounded,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                                width: 8,
                              ),
                              const Text(
                                "Add a note",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 35),
                    Container(
                        padding: const EdgeInsets.only(left: 30),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: custom_colors.primaryDarkPurple,
                                      shape: BoxShape.circle),
                                  child: const Icon(Icons.bookmark_add_outlined,
                                      color: Colors.white),
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  "Save",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 100),
                                Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                        color: custom_colors.primaryDarkPurple,
                                        shape: BoxShape.circle),
                                    child: const Icon(
                                      Icons.my_library_books,
                                      color: Colors.white,
                                      size: 20,
                                    )),
                                const SizedBox(width: 8),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Mode",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Story",
                                      style: TextStyle(
                                          color: custom_colors
                                              .secondaryLightPurple),
                                    )
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 30),
                            Row(
                              children: [
                                Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: custom_colors.primaryDarkPurple,
                                      shape: BoxShape.circle),
                                  child: const Icon(Icons.download,
                                      size: 20, color: Colors.white),
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  "Download",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 63),
                                Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                        color: custom_colors.primaryDarkPurple,
                                        shape: BoxShape.circle),
                                    child: const Center(
                                      child: Text(
                                        "1.0x",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                    )),
                                const SizedBox(width: 8),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Speed",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        )),
                    const SizedBox(height: 30),
                    Container(
                      height: 80,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Text(
                            "Story mode autoplay",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: custom_colors.primaryDarkPurple),
                          ),
                          const SizedBox(width: 130),
                          ToggleButton(false)
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Text(
                            "Images and videos",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: custom_colors.primaryDarkPurple),
                          ),
                          const SizedBox(width: 149),
                          ToggleButton(false)
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Text(
                            "Content attribution",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: custom_colors.primaryDarkPurple),
                          ),
                          const SizedBox(width: 155),
                          Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                color: custom_colors.primaryDarkPurple,
                                shape: BoxShape.circle),
                            child: const Center(
                              child: Center(
                                child: Icon(
                                  Icons.star_border,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Text(
                            "Report content",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: custom_colors.primaryDarkPurple),
                          ),
                          const SizedBox(width: 188),
                          Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                color: custom_colors.primaryDarkPurple,
                                shape: BoxShape.circle),
                            child: const Center(
                              child: Center(
                                child: Icon(
                                  Icons.warning_amber_outlined,
                                  size: 21,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Text(
                            "Leave a review",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: custom_colors.primaryDarkPurple),
                          ),
                          const SizedBox(width: 190),
                          Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                color: custom_colors.primaryDarkPurple,
                                shape: BoxShape.circle),
                            child: const Center(
                              child: Center(
                                child: Icon(
                                  Icons.chat_bubble_outline,
                                  size: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
