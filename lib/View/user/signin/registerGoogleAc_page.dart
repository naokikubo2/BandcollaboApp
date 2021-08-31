import 'dart:convert' show json;

import 'package:bandcollabo_app/Model/user/user_model.dart';
import 'package:bandcollabo_app/View/common/main.dart';
import 'package:bandcollabo_app/View/user/signin/registerIcon_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import "package:http/http.dart" as http;

// Google 認証
GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
  'email',
  'https://www.googleapis.com/auth/contacts.readonly',
]);

class RegisterGoogleAcPage extends StatefulWidget {
  @override
  _RegisterGoogleAcPageState createState() => _RegisterGoogleAcPageState();
}
class _RegisterGoogleAcPageState extends State<RegisterGoogleAcPage> {
  GoogleSignInAccount? _currentUser;
  String _contactText = '';

  // メッセージ表示用
  String infoText = '';

  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        _handleGetContact(_currentUser!);
      }
    });
    _googleSignIn.signInSilently();
  }

  Future<void> _handleGetContact(GoogleSignInAccount user) async {
    setState(() {
      _contactText = "Loading contact info...";
    });
    final http.Response response = await http.get(
      Uri.parse('https://people.googleapis.com/v1/people/me/connections'
          '?requestMask.includeField=person.names'),
      headers: await user.authHeaders,
    );
    if (response.statusCode != 200) {
      setState(() {
        _contactText = "People API gave a ${response.statusCode} "
            "response. Check logs for details.";
      });
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data = json.decode(response.body);
    final String? namedContact = _pickFirstNamedContact(data);
    setState(() {
      if (namedContact != null) {
        _contactText = "I see you know $namedContact!";
      } else {
        _contactText = "No contacts to display.";
      }
    });
  }

  String? _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic>? connections = data['connections'];
    final Map<String, dynamic>? contact = connections?.firstWhere(
          (dynamic contact) => contact['names'] != null,
      orElse: () => null,
    );
    if (contact != null) {
      final Map<String, dynamic>? name = contact['names'].firstWhere(
            (dynamic name) => name['displayName'] != null,
        orElse: () => null,
      );
      if (name != null) {
        return name['displayName'];
      }
    }
    return null;
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  Widget _buildBody() {
    GoogleSignInAccount? user = _currentUser;
    if (user != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ListTile(
            leading: GoogleUserCircleAvatar(
              identity: user,
            ),
            title: Text(user.displayName ?? ''),
            subtitle: Text(user.email),
          ),
          const Text("認証に成功しました。"),
          ElevatedButton(
            child: Text('次へ'),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => RegisterIconPage()
                ),
              );
            },
          )
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Text("You are not currently signed in."),
          ElevatedButton.icon(
            icon: Icon(Icons.android),
            label: Text('Google認証で登録'),
            onPressed: _handleSignIn,
          ),
        ],
      );
    }
  }
  @override

  Widget build(BuildContext context) {
    // ユーザー情報を受け取る
    final UserModel userModel = Provider.of<UserModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("ユーザー登録"),
      ),
      body: Center(
        child: Stack(
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: _buildBody(),
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