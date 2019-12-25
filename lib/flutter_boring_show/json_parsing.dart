// Core
import 'dart:convert' as json;
import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'serializers.dart';

part 'json_parsing.g.dart';

abstract class Article implements Built<Article, ArticleBuilder> {
  static Serializer<Article> get serializer => _$articleSerializer;

  int get id;

  bool get deleted;
  String get type;
  String get by;
  int get time;
  String get text;
  bool get dead;
  int get parent;
  int get poll;
  BuiltList<int> get kids;
  String get url;
  int get score;
  String get title;
  BuiltList<int> get parts;
  int get descendants;

  Article._();

  factory Article([updates(ArticleBuilder b)]) = _$Article;
}

List<int> parseTopStories(String jsonStr) {
  // final parsed = json.jsonDecode(jsonStr);
  // final listOfIds = List<int>.from(parsed);

  // return listOfIds;

  return [];
}

Article parseArticle(String jsonStr) {
  final parsed = json.jsonDecode(jsonStr);
  Article article = serializers.deserializeWith(Article.serializer, parsed);

  // return article;
  return null;
}
