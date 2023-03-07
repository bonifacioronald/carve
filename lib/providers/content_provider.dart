import 'package:carve_app/models/content_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ContentProvider with ChangeNotifier {
  List<String> contentIdList = [];
  ContentModel loadedContent = ContentModel(
    id: '',
    title: '',
    content: [],
    suitableCategories: [],
  );

  Future<void> fetchContentId() async {
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

  Future<void> fetchContentDataFromId(String contentId) async {
    await FirebaseFirestore.instance
        .collection('content')
        .doc(contentId)
        .get()
        .then(
      (snapshot) {
        loadedContent.id = snapshot.data()!['id'];
        loadedContent.title = snapshot.data()!['title'];
        List.from(snapshot.data()!['content']).forEach((content) {
          loadedContent.content.add(content);
        });
        for (int i = 0; i < loadedContent.content.length; i++) {
          String formattedString =
              loadedContent.content[i].replaceAll('\\n', '\n');
          loadedContent.content[i] = formattedString;
        }
        List.from(snapshot.data()!['suitableCategories']).forEach((category) {
          loadedContent.suitableCategories.add(category);
        });
      },
    );
  }
}
