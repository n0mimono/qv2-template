import 'package:flutter/material.dart';
import 'package:qv2/domains/models/article.dart';
import 'package:qv2/pages/article/presenter.dart';

class ArticlePage extends StatefulWidget {
  static String routeName =  '/article';

  @override
  State<StatefulWidget> createState() => ArticlePageState();
}

class ArticlePageState extends State<ArticlePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments as Map;
    final article =  arguments[ArticlePage.routeName];

    return ArticlePresenter(article: article);
  }
}
