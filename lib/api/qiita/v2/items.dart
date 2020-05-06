import 'package:qv2/api/qiita/v2/api.dart';

import 'items/items_response_article.dart';

class ItemsApi implements Api {
  @override
  String authority() => 'qiita.com';

  @override
  String uri() => '/api/v2/items';
}

class ItemsRequest implements Request {
  ItemsRequest({this.page, this.perPage});

  int page;
  int perPage;

  Map<String, String> queryParameters() => {
    'page': page.toString(),
    'per_page': perPage.toString(),
  };
}

class ItemsResponse implements Response {
  List<ItemsResponseArticle> articles;

  ItemsResponse.fromJson(dynamic json) {
    final data = json as List<dynamic>;
    final articles = data.map((item) => ItemsResponseArticle.fromJson(item));
    this.articles = articles.toList();
  }
}
