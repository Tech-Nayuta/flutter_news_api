import 'package:flutter/foundation.dart';
import 'package:flutter_news_api/repository/articles_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/news.dart';

final searchArticlesNotifierProvider = StateNotifierProvider<SearchArticlesNotifier, List<Article>>((ref) {
  return SearchArticlesNotifier();
});

class SearchArticlesNotifier extends StateNotifier<List<Article>> {
  SearchArticlesNotifier():  super([]);

  void search({
    required String query
  }) async {
    final ArticlesRepository repository = ArticlesRepositoryImpl();
    await repository.fetchSearchNews(query: query).then((result) {
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

