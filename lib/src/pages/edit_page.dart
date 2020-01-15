import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  static String routeName = '/pages/edit_page';
  EditPage({Key key}) : super(key: key);
  @override
  _EditPageState createState() => new _EditPageState();
}

class _EditPageState extends State<EditPage> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('アルバム'),
      ),
      body: ListView.builder(
        itemCount: 4,
        itemExtent: size.height/4,
        itemBuilder: (BuildContext context, int index){
          return Text(index.toString());
        },
      ),
    );
  }
}
