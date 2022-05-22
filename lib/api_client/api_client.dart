
import 'package:dio/dio.dart';
import 'package:flutter_news_api/model/article.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://newsapi.org/v2")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/top-headlines")
  Future<List<Article>> fetchHeadlines();
}