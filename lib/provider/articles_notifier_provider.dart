import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/article.dart';

class ArticlesNotifier extends StateNotifier<List<Article>> {
  ArticlesNotifier()
      : super(List<Article>.filled(
      30,
      Article(
        id: "1",
        title: "今日はいい天気ですね",
        description: "今日はいい天気ですね今日はいい天気ですね今日はいい天気ですね",
        url: "https://www.asahi.com/articles/ASQ5P6H2WQ5PPTQP00R.html",
        imageUrl:
        "https://upload.wikimedia.org/wikipedia/commons/9/94/Hanshin_tigers_insignia.PNG",
        publishedAt: DateTime.now(),
      )));
}

final articlesProvider =
StateNotifierProvider<ArticlesNotifier, List<Article>>((ref) {
  return ArticlesNotifier();
});