import 'package:carve_app/models/content_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ContentProvider with ChangeNotifier {
  List<ContentModel>? contentListData;

  Future<void> fetchContentListData() async {
    await FirebaseFirestore.instance
        .collection('content')
        .get()
        .then((snapshot) {});
  }
}
