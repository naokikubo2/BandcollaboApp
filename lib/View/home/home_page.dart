import 'package:bandcollabo_app/View/user/login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../sample_page.dart';

class HomePage extends StatelessWidget {
  static List<Widget> _pageList = [
    LoginPage(),
    SamplePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      await Navigator.pushReplacementNamed(context, "/login");
                    },
                    child: Text('Logout'),
                  ),
                  SizedBox(width: 20,),
                  ElevatedButton(
                    onPressed: () async {
                      Navigator.pushNamed(context, "/sample");
                    },
                    child: Text('サンプル'),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    child: Container(
                      margin: EdgeInsets.all(10.0), 
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(2),
                                    width: 50,
                                    height: 50,
                                    child: CircleAvatar(
                                      radius: 35,
                                      backgroundImage: AssetImage('images/guitar.png'),
                                      backgroundColor: Colors.white,
                                    ),
                                    decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: new Border.all(
                                        color: Colors.red,
                                        width: 4.0,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text('Naoki'),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                      'わがまま'+'/'+'KALMA',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.all(4),
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                    'ギター募集中',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                    'フルでカバーします。気さくに話して初心者大歓迎です。'
                                        '2ヶ月程度でゆるりと完成を目指しています。',
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('2021年9月16日'),
                            ],
                          )
                        ],
                      ),

                    ),
                  ),
                  Card(
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(2),
                                    width: 50,
                                    height: 50,
                                    child: CircleAvatar(
                                      radius: 35,
                                      backgroundImage: AssetImage('images/drum.png'),
                                      backgroundColor: Colors.white,
                                    ),
                                    decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: new Border.all(
                                        color: Colors.red,
                                        width: 4.0,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text('田中'),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'アストロビスタ'+ '\n' +'ハルカミライ',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.all(4),
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  'ギター募集中',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  'フルでカバーします。気さくに話して初心者大歓迎です。'
                                      '2ヶ月程度でゆるりと完成を目指しています。',
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('2021年8月21日'),
                            ],
                          )
                        ],
                      ),

                    ),
                  ),
                  Card(
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(2),
                                    width: 50,
                                    height: 50,
                                    child: CircleAvatar(
                                      radius: 35,
                                      backgroundImage: AssetImage('images/guitar.png'),
                                      backgroundColor: Colors.white,
                                    ),
                                    decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: new Border.all(
                                        color: Colors.red,
                                        width: 4.0,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text('Naoki'),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'わがまま'+'/'+'KALMA',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.all(4),
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  'ギター募集中',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  'フルでカバーします。気さくに話して初心者大歓迎です。'
                                      '2ヶ月程度でゆるりと完成を目指しています。',
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('2021年9月16日'),
                            ],
                          )
                        ],
                      ),

                    ),
                  ),
                  Card(
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(2),
                                    width: 50,
                                    height: 50,
                                    child: CircleAvatar(
                                      radius: 35,
                                      backgroundImage: AssetImage('images/guitar.png'),
                                      backgroundColor: Colors.white,
                                    ),
                                    decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: new Border.all(
                                        color: Colors.red,
                                        width: 4.0,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text('Naoki'),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'わがまま'+'/'+'KALMA',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.all(4),
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  'ギター募集中',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  'フルでカバーします。気さくに話して初心者大歓迎です。'
                                      '2ヶ月程度でゆるりと完成を目指しています。',
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('2021年9月16日'),
                            ],
                          )
                        ],
                      ),

                    ),
                  ),
                  Card(
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text('秒針を噛む'),
                              Text('/'),
                              Text('ずっと真夜中でいいのに'),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(2),
                                width: 50,
                                height: 50,
                                child: CircleAvatar(
                                  radius: 35,
                                  backgroundImage: AssetImage('images/vocal.png'),
                                  backgroundColor: Colors.white,
                                ),
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: new Border.all(
                                    color: Colors.red,
                                    width: 4.0,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),
                              Container(
                                padding: EdgeInsets.all(2),
                                width: 50,
                                height: 50,
                                child: CircleAvatar(
                                  radius: 35,
                                  backgroundImage: AssetImage('images/guitar.png'),
                                  backgroundColor: Colors.white,
                                ),
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: new Border.all(
                                    color: Colors.red,
                                    width: 4.0,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),
                              Container(
                                padding: EdgeInsets.all(2),
                                width: 50,
                                height: 50,
                                child: CircleAvatar(
                                  radius: 35,
                                  backgroundImage: AssetImage('images/bass.png'),
                                  backgroundColor: Colors.white,
                                ),
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: new Border.all(
                                    color: Colors.red,
                                    width: 4.0,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),
                              Container(
                                padding: EdgeInsets.all(2),
                                width: 50,
                                height: 50,
                                child: CircleAvatar(
                                  radius: 35,
                                  backgroundImage: AssetImage('images/drum.png'),
                                  backgroundColor: Colors.white,
                                ),
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: new Border.all(
                                    color: Colors.red,
                                    width: 4.0,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),
                              Container(
                                padding: EdgeInsets.all(2),
                                width: 50,
                                height: 50,
                                child: CircleAvatar(
                                  radius: 35,
                                  backgroundImage: AssetImage('images/piano.png'),
                                  backgroundColor: Colors.white,
                                ),
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: new Border.all(
                                    color: Colors.red,
                                    width: 4.0,
                                  ),
                                ),
                              ),

                            ],
                          )

                        ],
                      ),

                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}