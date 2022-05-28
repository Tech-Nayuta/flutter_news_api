import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/news.dart';

class ArticlesNotifier extends StateNotifier<List<Article>> {
  ArticlesNotifier()
      : super(List<Article>.filled(
      20,
      Article(
        source: const Source(id: "aaa", name: "aaa"),
        title: "今日はいい天気ですね今日はいい天気ですね今日はいい天気ですね今日はいい天気ですね今日はいい天気ですね今日はいい天気ですね今日はいい天気ですね今日はいい天気ですね今日はいい天気ですね",
        description: "今日はいい天気ですね今日はいい天気ですね今日はいい天気ですね",
        url: "https://www.asahi.com/articles/ASQ5P6H2WQ5PPTQP00R.html",
        urlToImage: "https://upload.wikimedia.org/wikipedia/commons/9/94/Hanshin_tigers_insignia.PNG",
        publishedAt: DateTime.now(),
      )));

  void refresh() {
    state = List<Article>.filled(
        20,
        Article(
          source: const Source(id: "aaa", name: "aaa"),
          title: "リフレッシュリフレッシュリフレッシュリフレッシュリフレッシュリフレッシュリフレッシュリフレッシュ",
          description: "リフレッシュリフレッシュリフレッシュリフレッシュリフレッシュリフレッシュリフレッシュリフレッシュ",
          url: "https://www.asahi.com/articles/ASQ5P6H2WQ5PPTQP00R.html",
          urlToImage: "https://newsatcl-pctr.c.yimg.jp/t/amd-img/20220519-00418726-usoccer-000-3-view.jpg?exp=10800",
          publishedAt: DateTime.now(),
        ));
  }
}

final articlesProvider =
StateNotifierProvider<ArticlesNotifier, List<Article>>((ref) {
  return ArticlesNotifier();
});