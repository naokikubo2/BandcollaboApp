import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'メールアドレス'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'パスワード'),
              ),
              Container(
                padding: EdgeInsets.all(8),
                // メッセージ表示
                child: Text("infoText"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}