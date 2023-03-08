import 'package:carve_app/models/forum_model.dart';
import 'package:carve_app/models/forum_reply_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ForumReplyProvider with ChangeNotifier {
  final _firebaseReply = FirebaseFirestore.instance;

  List<String> forumReplyIdList = [];
  List<ForumReplyModel> loadedForumReplyList = [];
  List<ForumReplyModel> filteredForumReplyList = [];

  Future<void>? createNewReply(String content) {
    FirebaseFirestore.instance.collection('forumReply').doc().set({
      "authorName": '',
      "content": content,
      'forumId': '',
      'replyId': '',
      'publishedDate': '',
    });
  }

  Future<void> fetchForumId() async {
    print('fetch');
    try {
      await FirebaseFirestore.instance.collection('forumReply').get().then(
        (snapshot) {
          snapshot.docs.forEach(
            (forumReply) {
              forumReplyIdList.add(forumReply.reference.id);
            },
          );
        },
      );
      print('Success! fetched forumId List: ${forumReplyIdList}');
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> fetchAllForumReplyData() async {
    for (int i = 0; i < forumReplyIdList.length; i++) {
      await fetchForumReplyDataFromId(forumReplyIdList[i]);
    }
    print('all done');
  }

  Future<void> fetchForumReplyDataFromId(String forumId) async {
    await FirebaseFirestore.instance
        .collection('forumReply')
        .doc(forumId)
        .get()
        .then(
      (snapshot) {
        ForumReplyModel loadedForum = ForumReplyModel(
          authorName: snapshot.data()!['authorName'],
          content: snapshot.data()!['content'],
          forumId: snapshot.data()!['forumId'],
          replyId: snapshot.data()!['replyId'],
          publishedDate: snapshot.data()!['publishedDate'],
        );
        loadedForumReplyList.add(loadedForum);
        print('fetched ${snapshot.data()!['title']}');
      },
    );
  }

  void selectDisplayedForumReplybyId(String id) {
    filteredForumReplyList = [];
    loadedForumReplyList.forEach((forumReply) {
      if (forumReply.forumId == id) {
        filteredForumReplyList.add(forumReply);
      }
    });
  }
}
