import 'package:bandcollabo_app/Model/user/userState.dart';
import 'package:bandcollabo_app/Model/user/user_model.dart';
import 'package:bandcollabo_app/View/common/main.dart';
import 'package:bandcollabo_app/View/user/signin/registerIcon_page.dart';
import 'package:bandcollabo_app/View/user/signin/registerPart_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterNamePage extends StatefulWidget {
  @override
  _RegisterNamePageState createState() => _RegisterNamePageState();
}
class _RegisterNamePageState extends State<RegisterNamePage> {
  String infoText = '';
  String name = '';

  @override
  Widget build(BuildContext context) {
    final UserState userState = Provider.of<UserState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("ニックネーム登録"),
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
                  Container(
                    padding: EdgeInsets.all(8),
                    // メッセージ表示
                    child: Text(
                        infoText,
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text('次へ'),
                      onPressed: () {
                        if (name == ''){
                          setState(() {
                            infoText = '名前を入力してください。';
                          });
                          }else{
                          userState.name = name;
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => RegisterPartPage()
                            ),
                          );
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