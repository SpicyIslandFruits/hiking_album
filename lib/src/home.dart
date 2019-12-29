import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String routeName = '/home';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/pages');
        },
        child: Icon(Icons.star),
      ),
    );
  }
}
