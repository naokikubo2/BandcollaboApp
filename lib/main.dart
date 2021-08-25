import 'package:bandcollabo_app/view/login/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import 'Model/user/user_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BandcollaboApp());
}

class BandcollaboApp extends StatelessWidget {
  final UserModel userModel = UserModel();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserModel>(create: (_)=> UserModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        //home: MyHomePage(title: 'Flutter Demo Home Page'),
        home: LoginPage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ElevatedButton(
        onPressed: () async {
          await FirebaseFirestore.instance
              .collection('post') // コレクションID指定
              .doc() // ドキュメントID自動生成
              .set({
            'text': "Hellow World",
          });
        },
        child: Text("click me"),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
