import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserModel extends ChangeNotifier{
  User? user;

  //新規登録
  Future signInEmail(String email, String password)async{
    final FirebaseAuth auth = FirebaseAuth.instance;
    final result = await auth.createUserWithEmailAndPassword(email: email, password: password);
    await createUserEmail(result.user!);
  }

  Future createUserEmail(User newUser)async{
    user = newUser;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .set({
      "uid": newUser.uid,
      "email": newUser.email,
    });
  }

  //ログイン
  Future logInEmail(String email, String password)async{
    final FirebaseAuth auth = FirebaseAuth.instance;
    final result = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    // ユーザー情報を更新
    user = result.user!;
  }

  bool checkUser(){
    final FirebaseAuth auth = FirebaseAuth.instance;
    user = auth.currentUser;
    return user != null;
  }
}