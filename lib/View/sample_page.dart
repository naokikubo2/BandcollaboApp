import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 8,
        title: Text('Sample'),
      ),
      body: Container(),
    );
  }
}
