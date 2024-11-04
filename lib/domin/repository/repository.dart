import 'package:news_app/domin/entities/article_entity.dart';

abstract class Repository {
  Future<List<ArticleEntity>> getNewsfromDAtaSources();
  Future<List<ArticleEntity>> searchNewsfromDataSources(String categorey);
  Future<List<ArticleEntity>> getsqfliteNewsfromDataSources();
  Future<void> sqfliteNewsAddfromDataSources(ArticleEntity article);
  Future<void> delectSqlnewsfromDtaSourses(int id);
}
