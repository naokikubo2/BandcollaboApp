import 'package:bandcollabo_app/Model/user/userState.dart';
import 'package:bandcollabo_app/Model/user/user_model.dart';
import 'package:bandcollabo_app/View/mypage/_editUserImage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyPage extends StatelessWidget {
  late UserState userState;
  @override
  Widget build(BuildContext context) {
    final UserModel userModel = Provider.of<UserModel>(context);
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



  _displayDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      //barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.9),
      transitionDuration: Duration(milliseconds: 200),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation,
            child: child,
          ),
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        final UserModel userModel = Provider.of<UserModel>(context);
        return Scaffold(
          body: Center(
            child: Container(
              width: MediaQuery.of(context).size.width-50,
              height: MediaQuery.of(context).size.height-200,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.clear, size: 18),
                      label: Text("閉じる"),
                    ),
                  ),
                  //closeButton(context, 50, () => null),
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
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
                              child: Text('この画像に変更しますか？'),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              width: double.infinity,
                              child: ElevatedButton(
                                child: Text('変更する'),
                                onPressed: () async {
                                  //try {
                                  await userModel.setUserImage(userModel.imageFile!);
                                  userModel.endLoading();
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: double.infinity,
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
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}