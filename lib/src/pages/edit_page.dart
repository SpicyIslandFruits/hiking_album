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
          ListTile(title: Text('AAA')),
          ListTile(title: Text('BBB')),
          ListTile(title: Text('CCC')),
        ],
      ),
    );
  }
}
