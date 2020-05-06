import 'package:flutter/material.dart';
import 'package:qv2/domains/models/article.dart';

class ArticlePresenter extends StatelessWidget {
  ArticlePresenter({this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Text(article.body),
          ],
        ),
      ),
    );
  }
}
