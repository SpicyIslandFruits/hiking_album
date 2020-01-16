import 'package:flutter/material.dart';

class MemoPage extends StatefulWidget {
  static String routeName = '/pages/memo_page';

  MemoPage({Key key, this.mountName}) : super(key: key);

  var mountName;

  @override
  _MemoPageState createState() => _MemoPageState();
}

class _MemoPageState extends State<MemoPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title:  Text('メモ'),
      ),

    );
  }
}