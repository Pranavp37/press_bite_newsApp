import 'package:news_app/core/constant/usecase/usecase.dart';
import 'package:news_app/domin/repository/repository.dart';
import 'package:news_app/service_locator.dart';

class AddnewsSqfliteUsecase extends Usecase {
  @override
  Future call({parms}) async {
    return await s1<Repository>().sqfliteNewsAddfromDataSources(parms);
  }
}
