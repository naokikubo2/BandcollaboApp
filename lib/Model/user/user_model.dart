import 'dart:io';

import 'package:bandcollabo_app/Model/user/userState.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class UserModel extends ChangeNotifier{
  UserState? userState;
  User? user;
  bool isLoading = false;
  File? imageFile;

  final _userCollection = FirebaseFirestore.instance.collection('users');

  startLoading(){
    isLoading = true;
    notifyListeners();
  }

  endLoading(){
    isLoading = false;
    notifyListeners();
  }

  //新規登録
  Future signInEmail(String email, String password, UserState userState)async{
    startLoading();
    final FirebaseAuth auth = FirebaseAuth.instance;
    final result = await auth.createUserWithEmailAndPassword(email: email, password: password);
    await createUserEmail(result.user!, userState);
  }

  Future createUserEmail(User newUser, UserState userState)async{
    user = newUser;
    await _userCollection
        .doc(user!.uid)
        .set({
      "uid": newUser.uid,
      "email": newUser.email,
      "name": userState.name,
      "part": userState.part,
      "mix": userState.mix,
      "movie": userState.movie,
    });
  }

  //楽器パート登録
  Future registerPart(bool isCheckedMix, bool isCheckedMovie, String part)async{
    startLoading();
    final FirebaseAuth auth = FirebaseAuth.instance;
    user = auth.currentUser;
    await _userCollection
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

  Future showImagePicker() async {
    final picker = ImagePicker();
    final pickerFile = await picker.getImage(source: ImageSource.gallery, imageQuality: 80);
    imageFile = File(pickerFile!.path);
    notifyListeners();
  }

  String imageUrl='';
  Future setUserImage(File imageFIle) async {
    startLoading();
    final FirebaseAuth auth = FirebaseAuth.instance;
    user = auth.currentUser;
    imageUrl = await _uploadImage(imageFile!, user!);
    await FirebaseFirestore.instance
        .collection('users') // コレクションID指定
        .doc(user!.uid) // ドキュメントID自動生成
        .update({
      'imagePath': imageUrl,
    });
    notifyListeners();
  }

  Future<String> _uploadImage(File file, User user) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    final String uid = user.uid;
    final String fileName = basename(file.path);
    Reference ref = storage.ref().child("images/user/$uid/$fileName");
    UploadTask uploadTask = ref.putFile(file);
    final TaskSnapshot downloadUrl= (await uploadTask);
    final String url= await downloadUrl.ref.getDownloadURL();
    return url;
  }

  Future fetchUser()async{
    final FirebaseAuth auth = FirebaseAuth.instance;
    user = auth.currentUser;
    final DocumentSnapshot snapshot = await _userCollection
        .doc(user!.uid) // ドキュメントID自動生成
        .get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    final String uid = data['uid'];
    final String name = data['name'];
    final String email = data['email'];
    final bool mix = data['mix'];
    final bool movie = data['movie'];
    final String part = data['part'];
    final String imageUrl = data['imagePath'];
    print("aa");
    this.userState = UserState(uid, name, email, mix, movie, part, imageUrl);
    notifyListeners();
  }
}