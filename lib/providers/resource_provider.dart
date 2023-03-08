import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../auth.dart';
import '../models/resources_model.dart';
import '../models/user_model.dart';

class ResourceProvider with ChangeNotifier {
  ResourcesModel resourceProviderData = ResourcesModel(
    id: '',
    title: '',
    location: '',
    categories: '',
    URLDirection: '',
  );

  Future<void> fetchResourceData() async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(Auth().currentUser!.uid)
        .get()
        .then(
      (snapshot) {
        resourceProviderData.id = snapshot.data()!['id'];
        resourceProviderData.title = snapshot.data()!['title'];
        resourceProviderData.location = snapshot.data()!['location'];
        resourceProviderData.categories = snapshot.data()!['category'];
        resourceProviderData.URLDirection = snapshot.data()!['URLDirection'];
      },
    );
  }
}
