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
      parentingStyle: '');

  Future<void> setUserName(String name) async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(Auth().currentUser!.uid)
        .update({"name": name});
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
    });
  }
}
