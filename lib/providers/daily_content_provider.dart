import 'package:carve_app/models/content_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DailyContentProvider with ChangeNotifier {
  List<String> contentIdList = [];
  ContentModel loadedPregnantContent = ContentModel(
      id: '', title: '', content: [], suitableCategories: [], thumbnailUrl: '');
  ContentModel loadedNonPregnantContent = ContentModel(
      id: '', title: '', content: [], suitableCategories: [], thumbnailUrl: '');

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

  Future<void> fetchDailyPregnancyContentDataFromId(String contentId) async {
    await FirebaseFirestore.instance
        .collection('content')
        .doc(contentId)
        .get()
        .then(
      (snapshot) {
        loadedPregnantContent.id = snapshot.data()!['id'];
        loadedPregnantContent.title = snapshot.data()!['title'];
        List.from(snapshot.data()!['content']).forEach((content) {
          loadedPregnantContent.content.add(content);
        });
        for (int i = 0; i < loadedPregnantContent.content.length; i++) {
          String formattedString =
              loadedPregnantContent.content[i].replaceAll('\\n', '\n');
          loadedPregnantContent.content[i] = formattedString;
        }
        List.from(snapshot.data()!['suitableCategories']).forEach((category) {
          loadedPregnantContent.suitableCategories.add(category);
        });
      },
    );
  }

  Future<void> fetchDailyNonPregnancyContentDataFromId(String contentId) async {
    await FirebaseFirestore.instance
        .collection('content')
        .doc(contentId)
        .get()
        .then(
      (snapshot) {
        loadedNonPregnantContent.id = snapshot.data()!['id'];
        loadedNonPregnantContent.title = snapshot.data()!['title'];
        List.from(snapshot.data()!['content']).forEach((content) {
          loadedNonPregnantContent.content.add(content);
        });
        for (int i = 0; i < loadedNonPregnantContent.content.length; i++) {
          String formattedString =
              loadedNonPregnantContent.content[i].replaceAll('\\n', '\n');
          loadedNonPregnantContent.content[i] = formattedString;
        }
        List.from(snapshot.data()!['suitableCategories']).forEach((category) {
          loadedNonPregnantContent.suitableCategories.add(category);
        });
      },
    );
  }
}
