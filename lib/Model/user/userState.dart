
import 'package:flutter/cupertino.dart';

class UserState extends ChangeNotifier {
  late String uid;
  late String name;
  late String email;
  late bool mix;
  late bool movie;
  late String part;
  late String imageUrl;
  UserState(this.uid, this.name, this.email, this.mix, this.movie, this.part, this.imageUrl);
  void setPart(String part, bool mix, bool movie){
    this.part = part;
    this.mix = mix;
    this.movie = movie;
  }

  void setAll(String uid, String name, String email, bool mix, bool movie,
      String part){
    this.uid = uid;
    this.name = name;
    this.email  = email;
    this.mix =mix;
    this.part = part;
    this.mix = mix;
    this.movie = movie;
    this.imageUrl = imageUrl;
  }

}