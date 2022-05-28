import 'package:dio/dio.dart';
import 'package:flutter_news_api/api_client/api_client.dart';
import 'package:flutter_news_api/api_client/environment_variables.dart';
import '../../model/news.dart';
import '../ui/response/result.dart';

abstract class ArticlesRepository {
  Future<Result<News>> fetchHeadlines({required String country, required String category});
}

class ArticlesRepositoryImpl extends ArticlesRepository {
  final ApiClient _client;

  ArticlesRepositoryImpl([ApiClient? client]): _client = client ?? ApiClient(Dio());

  @override
  Future<Result<News>> fetchHeadlines({required String country, required String category}) {
    return _client
        .fetchHeadlines(country, category, EnvironemntVariables.newsApiKey)
        .then((news) => Result<News>.success(news))
        .catchError((error)=>Result<News>.failure(error));
  }
}