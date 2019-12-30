import 'package:flutter/material.dart';

class MountSetPage extends StatelessWidget{
  static String routeName = '/pages/mounts_set_page';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('山一覧'),
      ),
    );
  }
}