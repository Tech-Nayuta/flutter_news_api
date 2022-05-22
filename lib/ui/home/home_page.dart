import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_api/ui/news_list/news_list_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../news_search/news_search_page.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Simple News"),
          ),
          bottomNavigationBar: Container(
            color: Theme.of(context).primaryColor,
            child: const TabBar(
              tabs: [
                Tab(text: "一覧", icon: Icon(Icons.list)),
                Tab(text: "検索", icon: Icon(Icons.search)),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              NewsListPage(),
              NewsSearchPage(),
            ],
          )
      ),
    );
  }
}
