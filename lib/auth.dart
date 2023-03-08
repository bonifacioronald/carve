import 'package:carve_app/screens/login_register_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void>? createUserWithEmailAndPassword(
    String email,
    String password,
  ) {
    _firebaseAuth
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      FirebaseFirestore.instance.collection('user').doc(value.user!.uid).set({
        "email": value.user!.email,
        "id": value.user!.uid,
        'name': '',
        'appUsageDuration': '',
        'childAge': '',
        'childGender': '',
        'isPregnant': false,
        'parentingStyle': '',
        'parentType': ''
      });
    });
    return null;
  }

  Future<void> signOut(BuildContext context) async {
    print('logout');
    await _firebaseAuth.signOut();
    Navigator.of(context).pushReplacementNamed(LoginRegisterScreen.routeName);
  }

  signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
