import 'package:flutter/material.dart';
import 'package:hiking_album/src/home.dart';
import 'package:hiking_album/src/pages.dart';
import 'src/focus_image.dart';

void main() => runApp(HikingAlbum());

class PageContext {
  final String name;
  final String route;
  final WidgetBuilder builder;

  const PageContext({this.name, this.route, this.builder});
}

final pageContexts = [
  PageContext(
      name: 'Focus Image',
      route: ListImage.routeName,
      builder: (context) => ListImage()),
  PageContext(
      name: 'Page List',
      route: PageListPage.routeName,
      builder: (context) => PageListPage()),
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
      home: HomePage(),
    );
  }
}
