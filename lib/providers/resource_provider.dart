import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../auth.dart';
import '../models/resources_model.dart';
import '../models/user_model.dart';

class ResourceProvider with ChangeNotifier {
 List<String> resourceIdList = [];
  List<ResourcesModel> loadedResourceList = [];

//dasdad
      Future<void> fetchResourceId() async {
    print('fetch');
    try {
      await FirebaseFirestore.instance.collection('resources').get().then(
        (snapshot) {
          snapshot.docs.forEach(
            (resource) {
              resourceIdList.add(resource.reference.id);
            },
          );
        },
      );
      print('Success! fetched resourceId List: ${resourceIdList}');
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> fetchAllResourceData() async {
    for (int i = 0; i < resourceIdList.length; i++) {
      await fetchResourceDataFromId(resourceIdList[i]);
    }
    print('all done');
  }


  Future<void> fetchResourceDataFromId(String resourceId) async {
    await FirebaseFirestore.instance
        .collection('resources')
        .doc(resourceId)
        .get()
        .then(
      (snapshot) {
        ResourcesModel loadedResource = ResourcesModel(
        
          categories: snapshot.data()!['category'],
          id: snapshot.data()!['id'],
          title: snapshot.data()!['title'],
          URLDirection: snapshot.data()!['URLDirection'],
          location: snapshot.data()!['location'],
        );
        loadedResourceList.add(loadedResource);
        print('fetched ${snapshot.data()!['title']}');
      },
    );
  }
}
