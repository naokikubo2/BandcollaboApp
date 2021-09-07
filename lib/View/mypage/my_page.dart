import 'package:bandcollabo_app/Model/user/userState.dart';
import 'package:bandcollabo_app/Model/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyPage extends StatelessWidget {
  late UserState userState;

  @override
  Widget build(BuildContext context) {
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
                          return Center(
                            child: Container(
                              padding: EdgeInsets.all(24),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 200,
                                    height: 200,
                                    child: InkWell(
                                      onTap: () async {
                                        await model.showImagePicker();
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
                                  ),
                                  Text(
                                    userState.name,
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      //border: Border.all(color: Colors.red),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.all(12),
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
                                  ),
                                  userState.mix ? Text("ミックス：○") : Text("ミックス：×"),
                                  userState.movie ? Text("動画編集：○") : Text("動画編集：×"),
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