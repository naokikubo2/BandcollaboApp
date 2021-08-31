import 'package:bandcollabo_app/Model/user/userState.dart';
import 'package:bandcollabo_app/View/user/signin/registerEmail_page.dart';
import 'package:bandcollabo_app/View/user/signin/registerGoogleAc_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectSignInPage extends StatefulWidget {
  @override
  _SelectSignInPageState createState() => _SelectSignInPageState();
}
class _SelectSignInPageState extends State<SelectSignInPage> {
  @override
  Widget build(BuildContext context) {
    final UserState userState = Provider.of<UserState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("登録方法の選択"),
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Container(
                    width: double.infinity,
                    // ログイン登録ボタン
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => RegisterEmailPage()
                          ),
                        );
                      },
                      icon: Icon(Icons.email),
                      label: Text('メールアドレスで登録する'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black45, //ボタンの背景色
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    // ユーザー登録ボタン
                    child: ElevatedButton.icon(
                      onPressed: () {
                        print(userState.email);
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => RegisterGoogleAcPage()
                          ),
                        );
                      },
                      icon: Icon(Icons.android),
                      label: Text("Googleアカウントで作成する"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}