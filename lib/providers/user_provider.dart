import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../auth.dart';
import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  UserModel currentUser = UserModel(
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
        .collection('users')
        .doc(Auth().currentUser!.uid)
        .update({"name": name});
  }

  Future<void> fetchUserData() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(Auth().currentUser!.uid)
        .get()
        .then((snapshot) {
      currentUser.id = snapshot.data()!['userId'];
      currentUser.name = snapshot.data()!['name'];
      currentUser.email = snapshot.data()!['email'];
    });
  }
}
