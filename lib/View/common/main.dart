import 'package:bandcollabo_app/View/common/root.dart';
import 'package:bandcollabo_app/view/login/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Model/user/user_model.dart';
import '../home/home_page.dart';
import '../sample_page.dart';

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
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: _LoginCheck(),
        routes: <String,WidgetBuilder>{
          '/home':(BuildContext context) => HomePage(),
          '/login':(BuildContext context) => LoginPage(),
          '/sample':(BuildContext context) => SamplePage(),
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
        ? RootWidget() : LoginPage();
  }
}