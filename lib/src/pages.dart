import 'package:flutter/material.dart';
import 'package:hiking_album/main.dart';

class PageListPage extends StatelessWidget {
  static String routeName = '/pages';

  Widget build(BuildContext context) {
    final headerStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      appBar: AppBar(
        title: Text('Page List'),
      ),
      body: ListView(
        children: [
          ListTile(title: Text('Misc', style: headerStyle)),
          ...pageContexts.map((d) => DemoTile(d)),
        ],
      ),
    );
  }
}

class DemoTile extends StatelessWidget {
  final PageContext demo;

  DemoTile(this.demo);

  Widget build(BuildContext context) {
    return ListTile(
      title: Text(demo.name),
      onTap: () {
        Navigator.pushNamed(context, demo.route);
      },
    );
  }
}
