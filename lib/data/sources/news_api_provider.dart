import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/domin/entities/article_entity.dart';
import 'package:news_app/core/constant/secrets/api_key.dart';

abstract class NewsApiProvider {
  Future<List<ArticleEntity>?> getNewsDAta();
  Future<List<ArticleEntity>?> searchNewsDAta(String categorey);
}

class NewsApiProviderImp extends NewsApiProvider {
  @override
  Future<List<ArticleEntity>?> getNewsDAta() async {
    List<ArticleEntity> newsEntities = [];
    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=keyword&apiKey=$secretsKey'));
    try {
      if (response.statusCode == 200) {
        final jsonData = newsModelFromJson(response.body);

        for (var article in jsonData.articles!) {
          newsEntities.add(article.toentity());
        }
        log(newsEntities[5].author.toString());
      }
      return newsEntities;
    } catch (e) {
      log("$e");
    }
    return null;
  }
  
  @override
  Future<List<ArticleEntity>?> searchNewsDAta(String categorey) async{
     List<ArticleEntity> newsEntities = [];
    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=$categorey&apiKey=$secretsKey'));
    try {
      if (response.statusCode == 200) {
        final jsonData = newsModelFromJson(response.body);

        for (var article in jsonData.articles!) {
          newsEntities.add(article.toentity());
        }
        log(newsEntities[5].author.toString());
      }
      return newsEntities;
    } catch (e) {
      log("$e");
    }
    return null;
  }

    
  }

