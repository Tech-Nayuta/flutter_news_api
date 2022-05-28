
import 'package:dio/dio.dart';
import 'package:flutter_news_api/model/news.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://newsapi.org/v2")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/top-headlines")
  Future<News> fetchHeadlines(
      @Query("country") String country,
      @Query("category") String category,
      @Query("apiKey") String apiKey,
  );
}