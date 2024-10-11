import 'package:news_app/data/sources/news_api_provider.dart';
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
}
