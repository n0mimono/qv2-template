import 'package:qv2/api/qiita/v2/api.dart';

abstract class QiitaServiceInterface {
  Future<TResponse> request<TRequest, TResponse>(Api api, TRequest req);
}