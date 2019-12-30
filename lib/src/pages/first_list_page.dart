import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  static String routeName = '/pages/edit_page';
  EditPage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<EditPage> {

  var listItem = ['one', 'two', 'three'];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('App Name'),
      ),
      body: ListView(
        children: [
          ListTile(title: Text('利尻岳')),
          ListTile(title: Text('羅臼岳')),
          ListTile(title: Text('斜里岳')),
          ListTile(title: Text('阿寒岳')),
          ListTile(title: Text('大雪山')),
          ListTile(title: Text('トムラウシ山')),
          ListTile(title: Text('十勝岳')),
          ListTile(title: Text('幌尻岳')),
          ListTile(title: Text('BBB')),
          ListTile(title: Text('CCC')),
          ListTile(title: Text('CCC')),
          ListTile(title: Text('CCC')),
          ListTile(title: Text('CCC')),
          ListTile(title: Text('CCC')),ListTile(title: Text('AAA')),
          ListTile(title: Text('BBB')),
          ListTile(title: Text('CCC')),
          ListTile(title: Text('CCC')),
          ListTile(title: Text('CCC')),
          ListTile(title: Text('CCC')),
          ListTile(title: Text('CCC')),

        ],
      ),
    );
  }
}
