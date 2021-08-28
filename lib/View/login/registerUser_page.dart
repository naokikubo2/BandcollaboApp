import 'package:bandcollabo_app/Model/user/userState.dart';
import 'package:bandcollabo_app/Model/user/user_model.dart';
import 'package:bandcollabo_app/View/common/main.dart';
import 'package:bandcollabo_app/View/home/home_page.dart';
import 'package:bandcollabo_app/View/login/registerPart_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterUserPage extends StatefulWidget {
  @override
  _RegisterUserPageState createState() => _RegisterUserPageState();
}
class _RegisterUserPageState extends State<RegisterUserPage> {
  // メッセージ表示用
  String infoText = '';
  // 入力したメールアドレス・パスワード
  String email = '';
  String password = '';
  String name = '';

  @override
  Widget build(BuildContext context) {
    // ユーザー情報を受け取る
    final UserModel userModel = Provider.of<UserModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("ユーザー登録"),
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'ニックネーム(他のSNSと同じ名前がおすすめ)'),
                    maxLength: 15,
                    onChanged: (String value) {
                      setState(() {
                        name = value;
                      });
                    },
                  ),
                  SizedBox(height: 30,),
                  // メールアドレス入力
                  TextFormField(
                    decoration: InputDecoration(labelText: 'メールアドレス'),
                    onChanged: (String value) {
                      setState(() {
                        email = value;
                      });
                    },
                  ),
                  // パスワード入力
                  TextFormField(
                    decoration: InputDecoration(labelText: 'パスワード'),
                    obscureText: true,
                    onChanged: (String value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    // メッセージ表示
                    child: Text(infoText),
                  ),
                  Container(
                    width: double.infinity,
                    // ユーザー登録ボタン
                    child: ElevatedButton(
                      child: Text('ユーザー登録'),
                      onPressed: () async {
                        try {
                          // メール/パスワードでユーザー登録
                          await userModel.signInEmail(name, email, password);
                          userModel.endLoading();
                          await Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => RegisterPartPage(),
                            ),
                                (route) => false,
                          );
                        } catch (e) {
                          userModel.endLoading();
                          // ユーザー登録に失敗した場合
                          setState(() {
                            infoText = "登録に失敗しました：${e.toString()}";
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            userModel.isLoading ? Container(
              color: Colors.grey.withOpacity(0.5),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
                : Container(),
          ],
        ),
      ),
    );
  }
}