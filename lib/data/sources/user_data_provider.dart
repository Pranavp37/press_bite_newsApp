import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/data/model/user_model.dart';

abstract class UserDataProvider {
  Future<UserModel?> getUserData();
}

class UserDataProviderImp extends UserDataProvider {
  @override
  Future<UserModel?> getUserData() async {
    try {
      var res = await FirebaseFirestore.instance
          .collection('news_app_users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      if (res != null) {
        var data = res.data();
        return UserModel(name: data!['name'], email: data['email']);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
