import 'package:flutter/cupertino.dart';
import 'package:qv2/api/qiita/v2/apis.dart';
import 'package:qv2/api/qiita/v2/items.dart';
import 'package:qv2/domains/interfaces/qiita.dart';
import 'package:qv2/domains/models/article.dart';

class Qiita {
  Qiita({@required this.service});

  QiitaServiceInterface service;

  Future<Catalog> fetchItems(int page, int perPage) async {
    final req = ItemsRequest(page: page, perPage: perPage);
    final res =
        await service.request<ItemsRequest, ItemsResponse>(Apis.items, req);
    final articles = res.articles
        .map((a) => Article(
            title: a.title,
            body: a.renderedBody,
            user: User(name: a.user.name, profileImageUrl: a.user.profileImageUrl)))
        .toList();
    return Catalog(articles: articles);
  }
}
