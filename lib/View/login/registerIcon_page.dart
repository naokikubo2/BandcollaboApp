import 'package:bandcollabo_app/Model/user/user_model.dart';
import 'package:bandcollabo_app/View/common/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterIconPage extends StatefulWidget {
  @override
  _RegisterIconPageState createState() => _RegisterIconPageState();
}
class _RegisterIconPageState extends State<RegisterIconPage> {
  String infoText = '';

  @override
  Widget build(BuildContext context) {
    final UserModel userModel = Provider.of<UserModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("アイコン画像登録"),
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
                        child: Text('他のSNSで使用しているアイコン画像が望ましいです'),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: double.infinity,
                        child: Column(
                            children:[
                              SizedBox(
                                width: 200,
                                height: 200,
                                child: InkWell(
                                  onTap: ()async{
                                    await userModel.showImagePicker();
                                  },
                                  child: userModel.imageFile != null ?
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.file(userModel.imageFile!, fit: BoxFit.fill,)
                                  )
                                      :
                                  Stack(
                                      children:[
                                        Container(
                                          padding: EdgeInsets.all(2),
                                          width: 200,
                                          height: 200,
                                          child: CircleAvatar(
                                            radius: 35,
                                            backgroundColor: Colors.grey[300],
                                            //backgroundImage: AssetImage('images/upload_icon.png')
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(70),
                                          width: 50,
                                          height: 50,
                                          alignment: Alignment.center,
                                          child: Image(image: AssetImage('images/upload_icon.png'), fit: BoxFit.fill,),
                                        ),
                                      ]
                                  ),
                                ),
                              ),
                            ]
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        child: Text(
                          '※後から変更可能です',
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        // メッセージ表示
                        child: Text(infoText),
                      ),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          child: Text('保存する'),
                          onPressed: () async {
                            //try {
                              await userModel.setUserImage(userModel.imageFile!);
                              await Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => BandcollaboApp()
                                ),
                              );
                            //} catch (e) {
                              // ログインに失敗した場合
                            //  setState(() {
                            //    infoText = "ログインに失敗しました：${e.toString()}";
                            //  });
                            //}
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        child: OutlinedButton(
                            child: Text('スキップする'),
                            onPressed: ()  {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => BandcollaboApp()
                                ),
                              );
                            }
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