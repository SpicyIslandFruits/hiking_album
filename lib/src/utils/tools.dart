import 'package:flutter/material.dart';
import 'package:hiking_album/src/utils/moutainDetail.dart';
import 'package:hiking_album/src/pages/memo_page.dart';

class MoutainTile extends StatelessWidget{
  final MountainDetail MoutainDetail;

  MoutainTile(this.MoutainDetail);

  Widget build(BuildContext context){
    return ListTile(
      title: Text(MoutainDetail.name),
      subtitle: Text('標高:'+MoutainDetail.elevation+'m'+' 地方:'+MoutainDetail.region),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return MemoPage();
              },
            ),
        );
      },
    );
  }
}
