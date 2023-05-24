import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../auth.dart';
import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  UserModel userProviderData = UserModel(
      id: '',
      name: '',
      email: '',
      appUsageDuration: '',
      childAge: '',
      childGender: '',
      isPregnant: false,
      numOfTimesPregnant: '',
      parentType: '');

  Future<void> setUserName(String name) async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(Auth().currentUser!.uid)
        .update({"name": name});
    print('Done name');
  }

  Future<void> setIsPregnant(bool isPregnant) async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(Auth().currentUser!.uid)
        .update({"isPregnant": isPregnant});
    print('Done pregnant');
  }

  Future<void> setParentType(String parentType) async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(Auth().currentUser!.uid)
        .update({"parentType": parentType});
    print('Done type');
  }

  Future<void> setChildAge(String age) async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(Auth().currentUser!.uid)
        .update({"childAge": age});
    print('Done age');
  }

  Future<void> setChildGender(String gender) async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(Auth().currentUser!.uid)
        .update({"childGender": gender});
    print('Done gender');
  }

  Future<void> setNumOfTimesPregnant(String parentingStyle) async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(Auth().currentUser!.uid)
        .update({"parentingStyle": parentingStyle});
    print('Done style');
  }

  Future<void> setAppUsageDuration(String appUsageDuration) async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(Auth().currentUser!.uid)
        .update({"appUsageDuration": appUsageDuration});
    print('Done usage');
  }

  Future<void> fetchUserData() async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(Auth().currentUser!.uid)
        .get()
        .then((snapshot) {
      userProviderData.id = snapshot.data()!['id'];
      userProviderData.name = snapshot.data()!['name'];
      userProviderData.email = snapshot.data()!['email'];
      userProviderData.appUsageDuration = snapshot.data()!['appUsageDuration'];
      userProviderData.childAge = snapshot.data()!['childAge'];
      userProviderData.childGender = snapshot.data()!['childGender'];
      userProviderData.numOfTimesPregnant = snapshot.data()!['parentingStyle'];
      userProviderData.parentType = snapshot.data()!['parentType'];
      userProviderData.isPregnant = snapshot.data()!['isPregnant'];
    });
  }
}
