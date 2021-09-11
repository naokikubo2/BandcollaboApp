import 'package:bandcollabo_app/Model/user/userState.dart';
import 'package:bandcollabo_app/Model/user/user_model.dart';
import 'package:bandcollabo_app/View/mypage/_editUserImage.dart';
import 'package:bandcollabo_app/View/mypage/_editUserInfo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyPage extends StatelessWidget {
  late UserState userState;
  @override
  Widget build(BuildContext context) {
    final UserModel userModel = Provider.of<UserModel>(context);

    _userImage(){
      return SizedBox(
        width: 100,
        height: 100,
        child: InkWell(
          onTap: () async {
            //_displayDialog(context);
            await userModel.editImagePicker();
            if(userModel.imageFile != null){
              await Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => EditUserImage()
                ),
              );
            }
          },
          child: userState.imageUrl != null ?
          ClipRRect(
              borderRadius: BorderRadius.circular(
                  100),
              child: Image.network(
                userState.imageUrl,
                fit: BoxFit.fill,)
          )
              :
          Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(2),
                  width: 200,
                  height: 200,
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors
                        .grey[300],
                    //backgroundImage: AssetImage('images/upload_icon.png')
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(70),
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  child: Image(image: AssetImage(
                      'images/upload_icon.png'),
                    fit: BoxFit.fill,),
                ),
              ]
          ),
        ),
      );
    }

    _userName(){
      return Text(
        userState.name,
        style: TextStyle(
          fontSize: 25,
        ),
      );
    }

    _userPart(){
      return Container(
        //width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.red,
          //border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(3),
        //color: Colors.red,
        child: Center(
          child: Text(
            userState.part,
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    _editButton(){
      return Container(
        //width: double.infinity,
        // ユーザー登録ボタン
        child: TextButton.icon(
          onPressed: () {
            userState.email = "test";
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => EditPartPage(),
              ),
            );
          },
          icon: Icon(Icons.edit_rounded, size: 18),
          label: Text("編集する"),
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: ChangeNotifierProvider<UserModel>(
                create: (_) => UserModel()..fetchUser(),
                child: Scaffold(
                  body: Consumer<UserModel>(
                      builder: (context, model, child) {
                        if (model.userState != null) {
                          userState = model.userState!;
                          userModel.userState = model.userState!;
                          return Center(
                            child: Container(
                              padding: EdgeInsets.all(24),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(children: [
                                    Column(children: [
                                      _userImage(),
                                      _userName(),
                                    ],),
                                    SizedBox(width: 40,),
                                    Column(children: [
                                      _editButton(),
                                      _userPart(),
                                      Row(children: [
                                        userState.mix ? Text("ミックス：○") : Text("ミックス：×"),
                                        SizedBox(width: 20,),
                                        userState.movie ? Text("動画編集：○") : Text("動画編集：×"),
                                      ],)
                                    ],)
                                  ],),
                                ],
                              ),
                            ),
                          );
                        }else{
                          return Center(
                              child: Container(
                              padding: EdgeInsets.all(24),
                                  child: Text('読み込み中...')
                        ));
                        }
                      }
                  ),
                ),
              ),
          )
        ],
      ),
    );
  }
}