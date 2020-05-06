abstract class Api {
  String authority();
  String uri();
}

abstract class Request {
  Map<String, String> queryParameters();
}

abstract class Response {}
