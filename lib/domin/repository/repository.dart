import 'package:news_app/data/model/user_model.dart';
import 'package:news_app/domin/entities/article_entity.dart';

abstract class Repository {
  Future<List<ArticleEntity>> getNewsfromDAtaSources();
  Future<List<ArticleEntity>> searchNewsfromDataSources(String categorey);
  Future<List<ArticleEntity>> getsqfliteNewsfromDataSources();
  Future<void> sqfliteNewsAddfromDataSources(ArticleEntity article);
  Future<void> delectSqlnewsfromDtaSourses(int id);
  Future<String?> usersignUp(UserModel model);
  Future<String?> usersignIn(UserModel model);
  Future<void> usersignOut();
  Future<UserModel?> getUserData();
}
