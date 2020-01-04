import 'package:flutter/material.dart';
import 'edit_page.dart';
import 'mounts_set_page.dart';

var list = {
  '1' : 'jkjkjk'
};

class HomePage extends StatefulWidget {
  static String routeName = '/pages/home_page';
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/pages');
          },
          child: Icon(Icons.star),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/first_page.jpg"),
                    fit: BoxFit.cover,
                  )
              ),
            ),

            Column(
              children: <Widget>[
                routePage(list['1'], EditPage()),
                routePage("insert image", MountSetPage()),
              ],
            )
          ],
        )
    );
  }


  Widget routePage(String title, Widget page) {
    return RaisedButton(
      child: Text(title),
      color: Colors.white,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return page;
            },
          ),
        );
      },
    );
  }
}