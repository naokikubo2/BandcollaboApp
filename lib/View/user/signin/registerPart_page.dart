import 'package:bandcollabo_app/Model/user/userState.dart';
import 'package:bandcollabo_app/Model/user/user_model.dart';
import 'package:bandcollabo_app/View/user/signin/registerIcon_page.dart';
import 'package:bandcollabo_app/View/user/signin/selectSignIn_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPartPage extends StatefulWidget {
  @override
  _RegisterPartPageState createState() => _RegisterPartPageState();
}
class _RegisterPartPageState extends State<RegisterPartPage> {
  String infoText = '';
  String part = 'ボーカル';

  bool isCheckedMix = false;
  bool isCheckedMovie = false;


  @override
  Widget build(BuildContext context) {
    final UserState userState = Provider.of<UserState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("担当パート登録"),
      ),
        body: Center(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(child: Text('担当パートは何ですか？'),),
                        const SizedBox(width: 20,),
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
                      ],
                    ),
                    Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            CheckboxListTile(
                              activeColor: Colors.blue,
                              title: Text('Mix担当可'),
                              subtitle: Text('Mix経験のある方、Mixをやってみたい方はチェック︎'),
                              secondary: new Icon(
                                Icons.thumb_up,
                                color: isCheckedMix ? Theme.of(context).accentColor : Colors.grey[500],
                              ),
                              controlAffinity: ListTileControlAffinity.leading,
                              value: isCheckedMix,
                              onChanged: (bool? value) {
                                setState(() {
                                  isCheckedMix = value!;
                                });
                              },
                            ),
                          ],
                        )
                    ),
                    Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            CheckboxListTile(
                              activeColor: Colors.blue,
                              title: Text('動画編集担当可'),
                              subtitle: Text('動画編集をやってもいい方はチェック︎'),
                              secondary: new Icon(
                                Icons.thumb_up,
                                color: isCheckedMovie ? Theme.of(context).accentColor : Colors.grey[500],
                              ),
                              controlAffinity: ListTileControlAffinity.leading,
                              value: isCheckedMovie,
                              onChanged: (bool? value) {
                                setState(() {
                                  isCheckedMovie = value!;
                                });
                              },
                            ),
                          ],
                        )
                    ),
                    Container(
                      child: Text(
                        '※後から変更可能です',
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                    // メールアドレス入力

                    Container(
                      padding: EdgeInsets.all(8),
                      // メッセージ表示
                      child: Text(infoText),
                    ),
                    Container(
                      width: double.infinity,
                      // ユーザー登録ボタン
                      child: ElevatedButton(
                        child: Text('次へ'),
                        onPressed: () async {
                          try {
                            // メール/パスワードでログイン
                            //await userModel.registerPart(isCheckedMix, isCheckedMovie, part);
                            //userModel.endLoading();
                            userState.setPart(part, isCheckedMix, isCheckedMovie);
                            // ログインに成功した場合
                            // チャット画面に遷移＋ログイン画面を破棄
                            await Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => SelectSignInPage()
                              ),
                            );
                          } catch (e) {
                            // ログインに失敗した場合
                            //userModel.endLoading();
                            setState(() {
                              infoText = "ログインに失敗しました：${e.toString()}";
                            });
                          }
                        },
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