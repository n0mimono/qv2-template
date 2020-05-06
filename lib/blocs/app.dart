import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:qv2/domains/models/article.dart';
import 'package:qv2/infra/qiita_service.dart';
import 'package:qv2/usecases/qiita.dart';

class AppBloc {
  final _catalogController = StreamController<Catalog>();

  Stream<Catalog> get catalog => _catalogController.stream;

  Catalog _catalog = Catalog(articles: List<Article>());

  int _page = 1;
  bool _fetching = false;

  Qiita _qiita = Qiita(service: QiitaService());

  void updateItems() async {
    if (_fetching) return;
    _fetching = true;

    final res = await _qiita.fetchItems(_page, 20);
    _page += 1;
    _fetching = false;

    _catalog.articles.addAll(res.articles);
    _catalogController.sink.add(_catalog);
  }

  void dispose() {
    _catalogController.close();
  }
}
