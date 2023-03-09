import 'package:carve_app/models/content_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ContentProvider with ChangeNotifier {
  List<String> contentIdList = [];
  List<ContentModel> loadedContentList = [];

  Future<void> fetchContentId() async {
    print('fetch');
    try {
      await FirebaseFirestore.instance.collection('content').get().then(
        (snapshot) {
          snapshot.docs.forEach(
            (content) {
              contentIdList.add(content.reference.id);
            },
          );
        },
      );
      print('Success! fetched contentId List: ${contentIdList}');
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> fetchAllContentData() async {
    for (int i = 0; i < contentIdList.length; i++) {
      await fetchContentDataFromId(contentIdList[i]);
    }
    print('all done');
  }

  Future<void> fetchContentDataFromId(String contentId) async {
    await FirebaseFirestore.instance
        .collection('content')
        .doc(contentId)
        .get()
        .then(
      (snapshot) {
        List<String> loadedCategory = [];
        List<String> loadedSlides = [];
        List.from(snapshot.data()!['suitableCategories']).forEach(
          (category) {
            loadedCategory.add(category);
          },
        );
        List.from(snapshot.data()!['content']).forEach((content) {
          loadedSlides.add(content);
        });
        for (int i = 0; i < loadedSlides.length; i++) {
          String formattedString = loadedSlides[i].replaceAll('\\n', '\n');
          loadedSlides[i] = formattedString;
        }

        ContentModel loadedContent = ContentModel(
            id: snapshot.data()!['id'],
            title: snapshot.data()!['title'],
            suitableCategories: loadedCategory,
            content: loadedSlides,
            thumbnailUrl: snapshot.data()!['thumbnailUrl']);
        loadedContentList.add(loadedContent);
        print('fetched ${snapshot.data()!['title']}');
      },
    );
  }
}
