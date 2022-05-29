import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_api/model/news.dart';

import 'articles_list_item.dart';

class ArticlesList extends StatelessWidget {
  const ArticlesList({
    Key? key,
    required this.articles,
    required this.onRefresh,
  }) : super(key: key);

  final List<Article> articles;
  final Function onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 0), () {
          onRefresh();
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
