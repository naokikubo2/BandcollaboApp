
import 'package:flutter/cupertino.dart';

class UserState extends ChangeNotifier {
  late int uid;
  late String name;
  late String email;
  late bool mix;
  late bool movie;
  late String part;
  //UserState(this.uid, this.name, this.email);
  void setPart(String part, bool mix, bool movie){
    this.part = part;
    this.mix = mix;
    this.movie = movie;
  }
}