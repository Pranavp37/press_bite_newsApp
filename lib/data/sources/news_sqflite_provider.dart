import 'dart:developer';

import 'package:news_app/domin/entities/article_entity.dart';
import 'package:sqflite/sqflite.dart';

abstract class NewsSqfliteProvider {
  Future<void> initDb();
  Future<void> addArticle(ArticleEntity article);
  Future<List<ArticleEntity>> getArticles();
  Future<void> deleteArticle(int id);
}

class NewsSqfliteProviderImp extends NewsSqfliteProvider {
  late Database database;

  @override
  Future<void> initDb() async {
    database = await openDatabase(
      'mydb',
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE Articles (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            author TEXT,
            title TEXT,
            description TEXT,
            url TEXT,
            urlToImage TEXT,
            publishedAt TEXT,
            content TEXT
          )
          ''');
      },
    );
  }

  @override
  Future<void> addArticle(ArticleEntity article) async {
    await database.insert(
      'Articles',
      {
        'author': article.author,
        'title': article.title,
        'description': article.description,
        'url': article.url,
        'urlToImage': article.urlToImage,
        'publishedAt': article.publishedAt?.toString(),
        'content': article.content,
        'id': article.id,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    final List<Map<String, dynamic>> maps = await database.query('Articles');
    log(maps.toString());
  }

  @override
  Future<List<ArticleEntity>> getArticles() async {
    final List<Map<String, dynamic>> maps = await database.query('Articles');

    return List.generate(maps.length, (i) {
      return ArticleEntity(
        author: maps[i]['author'],
        title: maps[i]['title'],
        description: maps[i]['description'],
        url: maps[i]['url'],
        urlToImage: maps[i]['urlToImage'],
        publishedAt: DateTime.tryParse(maps[i]['publishedAt']),
        content: maps[i]['content'],
        id: maps[i]['id'],
      );
    });
  }

  @override
  Future<void> deleteArticle(int id) async {
    await database.delete(
      'Articles',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
