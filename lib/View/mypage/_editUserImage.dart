import 'package:bandcollabo_app/Model/user/user_model.dart';
import 'package:bandcollabo_app/View/common/main.dart';
import 'package:bandcollabo_app/View/common/root.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditUserImage extends StatefulWidget {
  EditUserImage();

  @override
  _EditUserImageState createState() => _EditUserImageState();
}

class _EditUserImageState extends State<EditUserImage> {
  String messageText = '';
  @override
  Widget build(BuildContext context) {
    final UserModel userModel = Provider.of<UserModel>(context);
    return Scaffold(
        appBar: AppBar(
        title: Text('画像編集'),
        ),
      body: Stack(
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
                      await userModel.editUserImage(userModel.imageFile!);
                      userModel.endLoading();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => BandcollaboApp()
                        ),
                      );
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
    );
  }
}
