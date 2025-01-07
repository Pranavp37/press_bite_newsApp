import 'package:news_app/core/constant/usecase/usecase.dart';
import 'package:news_app/domin/repository/repository.dart';
import 'package:news_app/service_locator.dart';

class SignupUsecase extends Usecase {
  @override
  Future<String?> call({parms}) async {
    return s1<Repository>().usersignUp(parms);
  }
}
