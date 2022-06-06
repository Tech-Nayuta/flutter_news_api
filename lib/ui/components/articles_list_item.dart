import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_api/model/news.dart';
import 'package:flutter_news_api/ui/webview/custom_webview.dart';
import 'package:timeago/timeago.dart' as timeago;

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