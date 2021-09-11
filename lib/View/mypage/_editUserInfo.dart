import 'package:bandcollabo_app/Model/user/userState.dart';
import 'package:bandcollabo_app/Model/user/user_model.dart';
import 'package:bandcollabo_app/View/common/main.dart';
import 'package:bandcollabo_app/View/user/signin/registerIcon_page.dart';
import 'package:bandcollabo_app/View/user/signin/selectSignIn_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditPartPage extends StatefulWidget {
  @override
  _EditPartPageState createState() => _EditPartPageState();
}
class _EditPartPageState extends State<EditPartPage> {
  String infoText = '';
  String name = '';
  String part = 'ボーカル';

  bool isCheckedMix = false;
  bool isCheckedMovie = false;

  bool first = true;
  final txt = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final UserModel userModel = Provider.of<UserModel>(context);
    if (first){
      isCheckedMix = userModel.userState!.mix;
      isCheckedMovie = userModel.userState!.movie;
      part = userModel.userState!.part;
      name = userModel.userState!.name;
      txt.text = name;
      first =false;
    }
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
                  TextFormField(
                    controller: txt,
                    decoration: InputDecoration(
                      hintText: '他のSNSと同じ名前がおすすめ',
                      labelText: '名前*',
                      icon: Icon(Icons.account_box),
                    ),
                    maxLength: 15,
                    onChanged: (String value) {
                      setState(() {
                        name = value;
                      });
                    },
                  ),
                  SizedBox(height: 30,),
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
                    padding: EdgeInsets.all(8),
                    // メッセージ表示
                    child: Text(infoText),
                  ),
                  Container(
                    width: double.infinity,
                    // ユーザー登録ボタン
                    child: ElevatedButton(
                      child: Text('保存する'),
                      onPressed: () async {
                        try {
                          await userModel.editUserInfo(name, isCheckedMix, isCheckedMovie, part);
                          userModel.endLoading();
                          await Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => BandcollaboApp()
                            ),
                          );
                        } catch (e) {
                          // ログインに失敗した場合
                          //userModel.endLoading();
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
          ],
        ),
      ),
    );
  }
}