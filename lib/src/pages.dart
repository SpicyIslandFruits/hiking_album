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
          ...pageContexts.map((d) => PageTile(d)),
        ],
      ),
    );
  }
}

class PageTile extends StatelessWidget {
  final PageContext pageContext;

  PageTile(this.pageContext);

  Widget build(BuildContext context) {
    return ListTile(
      title: Text(pageContext.name),
      onTap: () {
        Navigator.pushNamed(context, pageContext.route);
      },
    );
  }
}
