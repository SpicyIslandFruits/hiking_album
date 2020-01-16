import 'package:flutter/material.dart';
import 'package:hiking_album/src/database/database_helper.dart';
import 'package:hiking_album/src/pages/memo_page.dart';

class ListPage extends StatefulWidget{
  ListPage({Key key, this.dbNum}) : super(key: key);

  var dbNum;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage>{
  static var db = DatabaseHelper();

  List<Widget> _items = <Widget>[];

  @override
  void initState() {
    super.initState();
    getItem();
  }

  /***@override
  void initState() {
    switch (widget.dbNum){
      case 1 :
        getHyakumeizan();
        break;
      default:
        getHyakumeizan();
    }
    super.initState();
  }***/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('リスト')
      ),
      body: ListView(
        children: _items
            
      )
    );
  }

  void getItem() async{
    List<Map> result = await db.getHyakumeizanList();
    List<ListTile> list = <ListTile>[];

    for (var item in result){
      list.add(
        ListTile(
          title: Text(item['name']),
        )
      );
    }

    setState(() {
      _items = list;
    });
  }

 /*** void getHyakumeizan() async{
    list = await db.getHyakumeizanList();
  }***/
}

class PageTile extends StatelessWidget {
  final Map mount;

  PageTile(this.mount);

  Widget build(BuildContext context) {
    return ListTile(
      title: Text(mount["name"]),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return MemoPage(mountName: mount["name"],);
            }
          )
        );
      },
    );
  }
}