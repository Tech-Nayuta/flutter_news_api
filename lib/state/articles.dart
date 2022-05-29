import 'package:flutter/foundation.dart';
import 'package:flutter_news_api/repository/articles_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/news.dart';

final articlesNotifierProvider = StateNotifierProvider<ArticlesNotifier, List<Article>>((ref) {
  return ArticlesNotifier();
});

class ArticlesNotifier extends StateNotifier<List<Article>> {
  ArticlesNotifier():  super([]);

  void fetch() async {
    final ArticlesRepository repository = ArticlesRepositoryImpl();
    await repository.fetchHeadlines(country: "us", category: "business").then((result) {
      result.when(success: (news) {
        state = news.articles;
      }, failure: (error) {
        if (kDebugMode) {
          print(error.message);
        }
      });
    });
  }
}

