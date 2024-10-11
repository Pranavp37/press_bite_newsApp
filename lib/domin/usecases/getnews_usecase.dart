import 'package:news_app/core/constant/usecase/usecase.dart';
import 'package:news_app/domin/entities/article_entity.dart';
import 'package:news_app/domin/repository/repository.dart';
import 'package:news_app/service_locator.dart';

class GetnewsUsecase implements Usecase {
  @override
  Future<List<ArticleEntity>> call({parms}) async {
    return await s1<Repository>().getNewsfromDAtaSources();
  }
}
