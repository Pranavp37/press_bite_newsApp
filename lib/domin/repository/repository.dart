import 'package:news_app/domin/entities/article_entity.dart';

abstract class Repository {
  Future<List<ArticleEntity>> getNewsfromDAtaSources();
    Future<List<ArticleEntity>> searchNewsfromDAtaSources(String categorey);

}
