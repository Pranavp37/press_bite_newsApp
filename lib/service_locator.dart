import 'package:get_it/get_it.dart';
import 'package:news_app/data/repository/repositoryimp.dart';
import 'package:news_app/data/sources/news_api_provider.dart';
import 'package:news_app/domin/repository/repository.dart';
import 'package:news_app/domin/usecases/getnews_usecase.dart';
import 'package:news_app/domin/usecases/getsearch_news_usecase.dart';

final GetIt s1 = GetIt.instance;

Future<void> setUp() async {
  s1.registerSingleton<NewsApiProvider>(NewsApiProviderImp());

  s1.registerSingleton<Repository>(RepositoryImp());

  s1.registerSingleton<GetnewsUsecase>(GetnewsUsecase());

  s1.registerSingleton<GetsearchNewsUsecase>(GetsearchNewsUsecase());
}
