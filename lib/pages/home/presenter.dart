import 'package:flutter/material.dart';
import 'package:qv2/pages/home/widgets/home_main.dart';
import 'package:qv2/pages/home/widgets/list.dart';

class HomePresenter extends StatelessWidget {
  HomePresenter({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.amber[600],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            HomeMain(),
            Divider(),
            HomeList(),
          ],
        ),
      ),
    );
  }
}
