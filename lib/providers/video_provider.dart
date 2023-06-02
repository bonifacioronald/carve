import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/video_model.dart';

class VideoProvider with ChangeNotifier {
  List<String> videoIdList = [];
  List<VideoModel> loadedVideoList = [];

  Future<void> fetchVideoId() async {
    print('fetch');
    try {
      await FirebaseFirestore.instance.collection('video').get().then(
        (snapshot) {
          snapshot.docs.forEach(
            (video) {
              videoIdList.add(video.reference.id);
            },
          );
        },
      );
      print('Success! fetched videoId List: ${videoIdList}');
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> fetchAllVideoData() async {
    for (int i = 0; i < videoIdList.length; i++) {
      await fetchVideoDataFromId(videoIdList[i]);
    }
    print('all done');
  }

  Future<void> fetchVideoDataFromId(String videoId) async {
    await FirebaseFirestore.instance
        .collection('video')
        .doc(videoId)
        .get()
        .then(
      (snapshot) {
        VideoModel loadedVideo = VideoModel(
          authorName: snapshot.data()!['authorName'],
          id: snapshot.data()!['id'],
          title: snapshot.data()!['title'],
          rating: snapshot.data()!['rating'],
          thumbnailUrl: snapshot.data()!['thumbnailUrl'],
          isForPregnancy: snapshot.data()!['isForPregnancy'],
        );

        loadedVideoList.add(loadedVideo);
        print('Fetched ${snapshot.data()!['title']}');
      },
    );
  }
}
