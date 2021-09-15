import 'package:bandcollabo_app/View/user/signin/registerIcon_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '_song.dart';

class CollaboPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ElevatedButton(
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => RegisterSong(),
              ),
            );
          },
          child: Text('コラボを作成する'),
        ),
      ),
    );
  }
}