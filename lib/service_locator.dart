import 'package:get_it/get_it.dart';
import 'package:news_app/data/repository/repositoryimp.dart';
import 'package:news_app/data/sources/auth_service.dart';
import 'package:news_app/data/sources/news_api_provider.dart';
import 'package:news_app/data/sources/news_sqflite_provider.dart';
import 'package:news_app/data/sources/user_data_provider.dart';
import 'package:news_app/domin/repository/repository.dart';
import 'package:news_app/domin/usecases/addnews_sqflite.dart';
import 'package:news_app/domin/usecases/delectnews_sqflite.dart';
import 'package:news_app/domin/usecases/getnews_sqflite.dart';
import 'package:news_app/domin/usecases/getnews_usecase.dart';
import 'package:news_app/domin/usecases/getsearch_news_usecase.dart';
import 'package:news_app/domin/usecases/getuserdata_usecase.dart';
import 'package:news_app/domin/usecases/signin_usecase.dart';
import 'package:news_app/domin/usecases/signout_usecase.dart';
import 'package:news_app/domin/usecases/signup_usecase.dart';

final GetIt s1 = GetIt.instance;

Future<void> setUp() async {
  s1.registerSingleton<NewsApiProvider>(NewsApiProviderImp());

  s1.registerSingleton<Repository>(RepositoryImp());

  s1.registerSingleton<GetnewsUsecase>(GetnewsUsecase());

  s1.registerSingleton<GetsearchNewsUsecase>(GetsearchNewsUsecase());

  s1.registerSingleton<NewsSqfliteProvider>(NewsSqfliteProviderImp());

  s1.registerSingleton<AddnewsSqfliteUsecase>(AddnewsSqfliteUsecase());

  s1.registerSingleton<GetnewsSqfliteUsecase>(GetnewsSqfliteUsecase());

  s1.registerSingleton<DelectnewsSqfliteUsecase>(DelectnewsSqfliteUsecase());

  s1.registerSingleton<AuthService>(AuthServiceImp());

  s1.registerSingleton<SignupUsecase>(SignupUsecase());

  s1.registerSingleton<SigninUsecase>(SigninUsecase());

  s1.registerSingleton<SignoutUsecase>(SignoutUsecase());

  s1.registerSingleton<UserDataProvider>(UserDataProviderImp());

  s1.registerSingleton<GetuserdataUsecase>(GetuserdataUsecase());
}
