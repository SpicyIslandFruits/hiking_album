import 'package:flutter/material.dart';

class MemoPage extends StatelessWidget{
  static String routeName = '/pages/memo_page';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('メモ'),
      ),

    );
  }
}