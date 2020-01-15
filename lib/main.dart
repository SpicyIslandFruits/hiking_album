import 'package:flutter/material.dart';
import 'package:hiking_album/src/pages/edit_page.dart';
import 'package:hiking_album/src/pages/home_page.dart';
import 'package:hiking_album/src/pages.dart';
import 'package:hiking_album/src/pages/mounts_set_page.dart';
import 'package:hiking_album/src/pages/memo_page.dart';
import 'src/pages/list_image.dart';

void main() => runApp(HikingAlbum());

class PageContext {
  final String name;
  final String route;
  final WidgetBuilder builder;

  const PageContext({this.name, this.route, this.builder});
}

final pageContexts = [
  PageContext(
      name: 'List Image',
      route: ListImage.routeName,
      builder: (context) => ListImage()),
  PageContext(
      name: 'Page List',
      route: PageListPage.routeName,
      builder: (context) => PageListPage()),
  PageContext(
      name: 'Home',
      route: HomePage.routeName,
      builder: (context) => HomePage()),
  PageContext(
      name: 'Edit',
      route: EditPage.routeName,
      builder: (context) => EditPage()),
  PageContext(
      name: 'Mounts Set',
      route: MountSetPage.routeName,
      builder: (context) => MountSetPage()),
  PageContext(
      name: 'Memo',
      route: MemoPage.routeName,
      builder: (context) => MemoPage()),
];

final tempRoutes =
    Map.fromEntries(pageContexts.map((d) => MapEntry(d.route, d.builder)));

final allRoutes = <String, WidgetBuilder>{
  ...tempRoutes,
};

class HikingAlbum extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hiking Album',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      routes: allRoutes,
      home: HomePage(title: 'ホーム'),
    );
  }
}
