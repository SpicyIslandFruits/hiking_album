import 'package:flutter/material.dart';
import 'edit_page.dart';
import 'mounts_set_page.dart';

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

            Align(
              alignment: Alignment(0.0, 0.5),
              child: SizedBox(
                width: 300,
                height: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Center(
                      child: ButtonTheme(
                        minWidth: 100,
                        height: 50,
                        child: routePage('アルバム', EditPage()),
                      ),
                    ),

                    Center(
                      child: ButtonTheme(
                        minWidth: 100,
                        height: 50,
                        child: routePage('リスト', MountSetPage()),
                      ),
                    )
                  ],
                ),
              ),
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