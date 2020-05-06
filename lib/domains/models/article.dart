class Catalog {
  Catalog({this.articles});

  List<Article> articles;
}

class Article {
  Article({this.title, this.body, this.user});

  String title;
  String body;
  User user;
}

class User {
  User({this.name, this.profileImageUrl});

  String name;
  String profileImageUrl;
}
