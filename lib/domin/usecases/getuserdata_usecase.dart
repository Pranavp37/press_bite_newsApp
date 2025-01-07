import 'package:news_app/core/constant/usecase/usecase.dart';
import 'package:news_app/data/model/user_model.dart';
import 'package:news_app/domin/repository/repository.dart';
import 'package:news_app/service_locator.dart';

class GetuserdataUsecase extends Usecase {
  @override
  Future<UserModel?> call({parms}) async {
    return await s1<Repository>().getUserData();
  }
}
