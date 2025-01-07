import 'package:news_app/core/constant/usecase/usecase.dart';
import 'package:news_app/domin/repository/repository.dart';
import 'package:news_app/service_locator.dart';

class SigninUsecase extends Usecase {
  @override
  Future<String?> call({parms}) {
    return s1<Repository>().usersignIn(parms);
  }
}
