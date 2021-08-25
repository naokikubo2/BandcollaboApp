import 'package:bandcollabo_app/view/login/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import 'Model/user/user_model.dart';
import 'View/home/home_page.dart';

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
        home: _LoginCheck(),
        routes: <String,WidgetBuilder>{
          '/home':(BuildContext context) => HomePage(),
          '/login':(BuildContext context) => LoginPage(),
        },
      ),
    );
  }
}

class _LoginCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ログイン状態に応じて、画面を切り替える
    final bool _loggedIn = Provider.of<UserModel>(context).checkUser();
    return _loggedIn
        ? HomePage() : LoginPage();
  }
}