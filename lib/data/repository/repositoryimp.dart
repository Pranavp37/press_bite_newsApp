import 'package:news_app/data/sources/news_api_provider.dart';
import 'package:news_app/data/sources/news_sqflite_provider.dart';
import 'package:news_app/domin/entities/article_entity.dart';
import 'package:news_app/domin/repository/repository.dart';
import 'package:news_app/service_locator.dart';

class RepositoryImp extends Repository {
  @override
  Future<List<ArticleEntity>> getNewsfromDAtaSources() async {
    List<ArticleEntity>? newsData = [];
    newsData = await s1<NewsApiProvider>().getNewsDAta();
    return newsData!;
  }

  @override
  Future<List<ArticleEntity>> searchNewsfromDataSources(
      String categorey) async {
    List<ArticleEntity>? newsData = [];
    newsData = await s1<NewsApiProvider>().searchNewsDAta(categorey);
    return newsData!;
  }

  @override
  Future<List<ArticleEntity>> getsqfliteNewsfromDataSources() async {
    List<ArticleEntity>? newsData = [];
    newsData = await s1<NewsSqfliteProvider>().getArticles();
    return newsData;
  }

  @override
  Future<void> sqfliteNewsAddfromDataSources(ArticleEntity article) async {
    await s1<NewsSqfliteProvider>().addArticle(article);
  }

  @override
  Future<void> delectSqlnewsfromDtaSourses(int id) async {
    await s1<NewsSqfliteProvider>().deleteArticle(id);
  }
}
