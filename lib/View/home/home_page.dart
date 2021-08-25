import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 8,
        title: Text('Home'),
      ),
      body: Container(
        child: ElevatedButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            await Navigator.pushReplacementNamed(context, "/login");
          },
          child: Text('Logout'),
        ),
      ),
    );
  }
}