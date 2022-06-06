import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_api/model/news.dart';
import 'package:flutter_news_api/state/articles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_api/ui/components/articles_list.dart';
import 'package:flutter_news_api/ui/components/articles_list_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewsListPage extends HookConsumerWidget {
  const NewsListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Article> articles = ref.watch(articlesNotifierProvider);

    useMemoized(() => {
      ref.read(articlesNotifierProvider.notifier).fetch()
    });

    return ArticlesList(
        articles: articles,
        onRefresh: () {
          ref.read(articlesNotifierProvider.notifier).fetch();
        },
    );
  }
}
