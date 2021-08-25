import 'package:bandcollabo_app/View/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(

          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'メールアドレス'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'パスワード'),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                // メッセージ表示
                child: ElevatedButton(
                  onPressed: () {
                  },
                  child: Text(
                    "新規登録"
                  ),
                )
              ),
              const SizedBox(height: 8),
              Container(
                  width: double.infinity,
                  // メッセージ表示
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                        "ログイン"
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}