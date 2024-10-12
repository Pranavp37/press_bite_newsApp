import 'package:news_app/core/constant/usecase/usecase.dart';
import 'package:news_app/domin/repository/repository.dart';
import 'package:news_app/service_locator.dart';

class GetsearchNewsUsecase extends Usecase {
  @override
  Future call({parms}) {
    return s1<Repository>().searchNewsfromDAtaSources(parms);
  }
}
