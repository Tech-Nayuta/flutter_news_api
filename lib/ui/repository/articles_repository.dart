import 'package:dio/dio.dart';
import 'package:flutter_news_api/api_client/api_client.dart';
import '../../model/article.dart';
import '../response/result.dart';

abstract class ArticlesRepository {
  Future<Result<List<Article>>> fetchHeadlines();
}

class ArticlesRepositoryImpl extends ArticlesRepository {
  final ApiClient _client;

  ArticlesRepositoryImpl([ApiClient? client]): _client = client ?? ApiClient(Dio())

  @override
  Future<Result<List<Article>>> fetchHeadlines() {
    return _client
        .fetchHeadlines()
        .then((articles) => Result<List<Article>>.success(articles))
        .catchError((error)=>Result<List<Article>>.failure(error));
  }
}