import 'package:flutter/cupertino.dart';
import 'package:flutter_news_api/ui/webview/custom_webview.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../model/news.dart';
import '../../provider/articles_notifier_provider.dart';
import '../../state/articles_notifier_provider.dart';

class ArticleListItem extends StatelessWidget {
  const ArticleListItem({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('ja', timeago.JaMessages());
    final now = DateTime.now();
    final ago = now.difference(article.publishedAt);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return CustomWebview(url: article.url);
        }));
      },
      child: Container(
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.3, color: Colors.grey))),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        height: 100,
        child: Row(
          children: [
            Image.network(
              article.urlToImage ??
                  "https://www.shoshinsha-design.com/wp-content/uploads/2020/05/noimage-760x460.png",
              width: 70,
              height: 70,
            ),

            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      timeago.format(now.subtract(ago), locale: 'ja'),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      article.title ?? "No title",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ),
            // )
          ],
        ),
      ),
    );
  }
}

class NewsListPage extends HookConsumerWidget {
  const NewsListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Article> articles = ref.watch(articlesNotifierProvider);
    ref.read(articlesNotifierProvider.notifier).fetchHeadlines();

    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 0), () {
          ref.read(articlesNotifierProvider.notifier).fetchHeadlines();
        });
      },
      child: Center(
        child: ListView.builder(
            padding: const EdgeInsets.only(top: 5),
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return ArticleListItem(article: articles[index]);
            }),
      ),
    );
  }
}
