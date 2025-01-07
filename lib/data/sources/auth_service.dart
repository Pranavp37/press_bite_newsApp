import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/data/model/user_model.dart';

abstract class AuthService {
  Future signUp(UserModel model);
  Future signIn(UserModel model);
  Future signOut();
}

class AuthServiceImp extends AuthService {
  @override
  Future<String?> signUp(UserModel model) async {
    try {
      var res = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: model.email!, password: model.password!);
      await FirebaseFirestore.instance
          .collection('news_app_users')
          .doc(res.user!.uid)
          .set({
        "name": model.name,
        "email": model.email,
      });
      return null;
    } catch (e) {
      log(e.toString());
      return e.toString();
    }
  }

  @override
  Future<String?> signIn(UserModel model) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: model.email!, password: model.password!);
      return null;
    } catch (e) {
      log(e.toString());
      return e.toString();
    }
  }

  @override
  Future signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      log(e.toString());
    }
  }
}
