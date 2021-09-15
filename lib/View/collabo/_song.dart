import 'package:bandcollabo_app/View/collabo/_member.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterSong extends StatefulWidget {
  @override
  _RegisterSongState createState() => _RegisterSongState();
}

class _RegisterSongState extends State<RegisterSong> {
  String songName = '';
  String bandName = '';
  String infoText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("コラボ曲の登録"),
      ),
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
                      decoration: InputDecoration(labelText: '曲名*'),
                      onChanged: (String value) {
                        setState(() {
                          songName = value;
                        });
                      },),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'バンド名*'),
                        onChanged: (String value) {
                          setState(() {
                            bandName = value;
                          });
                        },
                      ),
                      SizedBox(height: 30,),
                      Container(
                        width: double.infinity,
                        // ログイン登録ボタン
                        child: ElevatedButton(
                          child: Text('次へ'),
                          onPressed: () {
                            try {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => RegisterMember(),
                                ),
                              );
                              // メール/パスワードでログイン
                              //await userModel.logInEmail(email, password);
                              //userModel.endLoading();
                              // ログインに成功した場合
                              // チャット画面に遷移＋ログイン画面を破棄
                            } catch (e) {
                              setState(() {
                                infoText = "ログインに失敗しました：${e.toString()}";
                              });
                            }
                          },
                        ),
                      ),
                    ]
                )
              )
            ]
        ),
      ),
    );
  }
}