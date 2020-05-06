import 'package:json_annotation/json_annotation.dart';

part 'items_response_article.g.dart';

@JsonSerializable()
class ItemsResponseArticle {
  ItemsResponseArticle(this.title, this.renderedBody, this.user);

  final String title;
  @JsonKey(name: 'rendered_body')
  final String renderedBody;
  final ItemsResponseArticleUser user;

  factory ItemsResponseArticle.fromJson(Map<String, dynamic> json) =>
      _$ItemsResponseArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsResponseArticleToJson(this);
}

@JsonSerializable()
class ItemsResponseArticleUser {
  ItemsResponseArticleUser(this.name, this.profileImageUrl);

  final String name;
  @JsonKey(name: 'profile_image_url')
  final String profileImageUrl;

  factory ItemsResponseArticleUser.fromJson(Map<String, dynamic> json) =>
      _$ItemsResponseArticleUserFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsResponseArticleUserToJson(this);
}
