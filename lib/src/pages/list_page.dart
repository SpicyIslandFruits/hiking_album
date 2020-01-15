import 'package:flutter/material.dart';
import 'package:hiking_album/src/database/database_helper.dart';

class ListPage extends StatefulWidget{
  ListPage({Key key, this.dbNum}) : super(key: key);

  var dbNum;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage>{
  var db = DatabaseHelper();
  List<String> names ;
  List<String> heights;
  List<String> regions;

  @override
  void initState() {
    switch (widget.dbNum){
      case 1 :
        getHyakumeizan();
        break;
      default:
        getHyakumeizan();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('リスト')
      ),
      body: ListView.builder(

      )
    );
  }

  void getHyakumeizan() async{
    var list = await db.getHyakumeizanList();
    for(var item in list){
      names.add(item[0].toString());
      heights.add(item[1].toString());
      regions.add(item[2].toString());
    }
  }
}