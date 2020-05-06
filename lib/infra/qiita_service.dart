import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:qv2/api/qiita/v2/api.dart';
import 'package:qv2/api/qiita/v2/items.dart';
import 'package:qv2/domains/interfaces/qiita.dart';

class QiitaService implements QiitaServiceInterface {
  @override
  Future<TResponse> request<TRequest, TResponse>(Api api, TRequest req) async {
    if (req is ItemsRequest) {
      return _getItems(api, req) as Future<TResponse>;
    } else {
      return null;
    }
  }

  Future<ItemsResponse> _getItems(Api api, ItemsRequest req) async {
    final url = Uri.https(api.authority(), api.uri(), req.queryParameters());
    final res = await http.get(url);
    return ItemsResponse.fromJson(json.decode(res.body));
  }
}
