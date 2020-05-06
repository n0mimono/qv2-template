// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_response_article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemsResponseArticle _$ItemsResponseArticleFromJson(Map<String, dynamic> json) {
  return ItemsResponseArticle(
    json['title'] as String,
    json['rendered_body'] as String,
    json['user'] == null
        ? null
        : ItemsResponseArticleUser.fromJson(
            json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ItemsResponseArticleToJson(
        ItemsResponseArticle instance) =>
    <String, dynamic>{
      'title': instance.title,
      'rendered_body': instance.renderedBody,
      'user': instance.user,
    };

ItemsResponseArticleUser _$ItemsResponseArticleUserFromJson(
    Map<String, dynamic> json) {
  return ItemsResponseArticleUser(
    json['name'] as String,
    json['profile_image_url'] as String,
  );
}

Map<String, dynamic> _$ItemsResponseArticleUserToJson(
        ItemsResponseArticleUser instance) =>
    <String, dynamic>{
      'name': instance.name,
      'profile_image_url': instance.profileImageUrl,
    };
