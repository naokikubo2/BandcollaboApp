import 'package:bandcollabo_app/Model/user/userState.dart';
import 'package:bandcollabo_app/Model/user/user_model.dart';
import 'package:bandcollabo_app/View/common/main.dart';
import 'package:bandcollabo_app/View/user/signin/registerName_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  // メッセージ表示用
  String infoText = '';
  // 入力したメールアドレス・パスワード
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    // ユーザー情報を受け取る
    final UserModel userModel = Provider.of<UserModel>(context);
    final UserState userState = Provider.of<UserState>(context);
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
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
                    // ログイン登録ボタン
                    child: ElevatedButton(
                      child: Text('ログイン'),
                      onPressed: () async {
                        try {
                          // メール/パスワードでログイン
                          await userModel.logInEmail(email, password);
                          userModel.endLoading();
                          // ログインに成功した場合
                          // チャット画面に遷移＋ログイン画面を破棄
                          await Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => BandcollaboApp()
                            ),
                          );
                        } catch (e) {
                          // ログインに失敗した場合
                          userModel.endLoading();
                          setState(() {
                            infoText = "ログインに失敗しました：${e.toString()}";
                          });
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    //width: double.infinity,
                    // ユーザー登録ボタン
                   child: TextButton.icon(
                     onPressed: () {
                       userState.email = "test";
                       Navigator.of(context).push(
                         MaterialPageRoute(builder: (context) => RegisterNamePage(),
                         ),
                       );
                     },
                     icon: Icon(Icons.add, size: 18),
                     label: Text("ユーザー登録する"),
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