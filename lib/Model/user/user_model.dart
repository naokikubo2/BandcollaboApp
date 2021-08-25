import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserModel {
  User? user;

  void signInEmail(String email, String password)async{
    final FirebaseAuth auth = FirebaseAuth.instance;
    final result = await auth.createUserWithEmailAndPassword(email: email, password: password);
    createUserEmail(result.user!);
  }

  void createUserEmail(User newUser)async{
    user = newUser;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .set({
      "uid": newUser.uid,
      "email": newUser.email,
    });
  }
}


//新規登録


//ログイン