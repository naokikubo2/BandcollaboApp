import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterMember extends StatefulWidget {
  @override
  _RegisterMemberState createState() => _RegisterMemberState();
}

class _RegisterMemberState extends State<RegisterMember> {
  String infoText = '';
  String part = 'ボーカル';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("コラボメンバーの登録"),
      ),
      body: Center(
        child: Stack(
            children: [
              Container(
                  padding: EdgeInsets.all(24),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        DropdownButton<String>(
                          value: part,
                          icon: const Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              part = newValue!;
                            });
                          },
                          items: <String>['ボーカル', 'ギター', 'ベース', 'ドラム', 'ピアノ', 'トランペット']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),


                        SizedBox(height: 30,),
                        Container(
                          width: double.infinity,
                          // ログイン登録ボタン
                          child: ElevatedButton(
                            child: Text('次へ'),
                            onPressed: () {
                              try {
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