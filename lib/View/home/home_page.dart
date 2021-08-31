import 'package:bandcollabo_app/View/user/login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../sample_page.dart';

class HomePage extends StatelessWidget {
  static List<Widget> _pageList = [
    LoginPage(),
    SamplePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                await Navigator.pushReplacementNamed(context, "/login");
              },
              child: Text('Logout'),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.pushNamed(context, "/sample");
              },
              child: Text('サンプル'),
            ),
          ],
        ),
      ),
    );
  }
}