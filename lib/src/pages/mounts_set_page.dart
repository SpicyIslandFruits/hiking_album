import 'package:flutter/material.dart';
import 'package:hiking_album/src/pages/list_page.dart';

class MountSetPage extends StatelessWidget{
  static String routeName = '/pages/mounts_set_page';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('100名山リスト'),
      ),

      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('百名山'),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return ListPage(dbNum: 1);
                  }
                )
              );
            },
          ),
          ListTile(
            title: Text('二百名山'),
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) {
                        return ListPage(dbNum: 1);
                      }
                  )
              );
            },
          ),
          ListTile(
            title: Text('三百名山'),
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) {
                        return ListPage(dbNum: 1);
                      }
                  )
              );
            },
          ),
          ListTile(
            title: Text('マイリスト'),
          )
        ],
      )
    );
  }
}