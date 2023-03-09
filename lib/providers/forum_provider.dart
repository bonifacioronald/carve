import 'package:carve_app/models/forum_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ForumProvider with ChangeNotifier {
  List<String> forumIdList = [];
  List<ForumModel> loadedForumList = [];

  Future<void>? createNewForum(String content) {
    FirebaseFirestore.instance.collection('forum').doc().set({
      "authorName": '',
      "category": '',
      "content": content,
      'id': '',
      'publishedDate': '',
      'title': '',
      'totalLikes': '',
      'totalReplies': '',
    });
  }

  Future<void> fetchForumId() async {
    print('fetch');
    try {
      await FirebaseFirestore.instance.collection('forum').get().then(
        (snapshot) {
          snapshot.docs.forEach(
            (forum) {
              forumIdList.add(forum.reference.id);
            },
          );
        },
      );
      print('Success! fetched forumId List: ${forumIdList}');
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> fetchAllForumData() async {
    for (int i = 0; i < forumIdList.length; i++) {
      await fetchForumDataFromId(forumIdList[i]);
    }
    print('all done');
  }

  Future<void> fetchForumDataFromId(String forumId) async {
    await FirebaseFirestore.instance
        .collection('forum')
        .doc(forumId)
        .get()
        .then(
      (snapshot) {
        ForumModel loadedForum = ForumModel(
          authorName: snapshot.data()!['authorName'],
          category: snapshot.data()!['category'],
          content: snapshot.data()!['content'],
          id: snapshot.data()!['id'],
          publishedDate: DateTime.now(),
          title: snapshot.data()!['title'],
          totalLikes: snapshot.data()!['totalLikes'],
          totalReplies: snapshot.data()!['totalReplies'],
        );
        loadedForumList.add(loadedForum);
        print('fetched ${snapshot.data()!['title']}');
      },
    );
  }
}
