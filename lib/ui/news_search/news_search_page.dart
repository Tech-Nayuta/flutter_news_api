import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_api/state/news_search_text_controller.dart';
import 'package:flutter_news_api/state/search_articles.dart';
import 'package:flutter_news_api/ui/components/articles_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewsSearchPage extends HookConsumerWidget {
  const NewsSearchPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchTextController = ref.watch(newsSearchTextProvider);
    final articles = ref.watch(searchArticlesNotifierProvider);

    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 10, top: 5, right: 10),
          child: Column(
            children: [
              TextFormField(
                controller: searchTextController,
                onFieldSubmitted: (text) {
                  if(text.isNotEmpty) {
                    ref.read(searchArticlesNotifierProvider.notifier).search(
                        query: text);
                  }
                },
              ),
              Flexible(
                child: ArticlesList(
                  articles: articles,
                  onRefresh: () {
                    ref.read(searchArticlesNotifierProvider.notifier).search(
                        query: searchTextController.text);
                  },
                ),
              ),
            ],
          ),
        ),
    );
  }
}