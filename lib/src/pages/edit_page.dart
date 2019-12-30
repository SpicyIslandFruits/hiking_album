import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

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
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black38),
                ),
              ),
              child: ListTile(
                leading: const Icon(Icons.flight_land),
                title: Text('$index'),
                subtitle: Text('&listItem'),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage())
                  );
                },
              ));},
        itemCount: listItem.length,
      ),
    );
  }
}
