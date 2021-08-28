import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserModel extends ChangeNotifier{
  User? user;
  bool isLoading = false;

  startLoading(){
    isLoading = true;
    notifyListeners();
  }

  endLoading(){
    isLoading = false;
    notifyListeners();
  }

  //新規登録
  Future signInEmail(String name, String email, String password)async{
    startLoading();
    final FirebaseAuth auth = FirebaseAuth.instance;
    final result = await auth.createUserWithEmailAndPassword(email: email, password: password);
    await createUserEmail(result.user!, name);
  }

  Future createUserEmail(User newUser, String name)async{
    user = newUser;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .set({
      "uid": newUser.uid,
      "email": newUser.email,
      "name": name,
    });
  }

  //楽器パート登録
  Future registerPart(bool isCheckedMix, bool isCheckedMovie, String part)async{
    startLoading();
    final FirebaseAuth auth = FirebaseAuth.instance;
    user = auth.currentUser;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({
      "part": part,
      "mix": isCheckedMix,
      "movie": isCheckedMovie,
    });
  }

  //ログイン
  Future logInEmail(String email, String password)async{
    startLoading();
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