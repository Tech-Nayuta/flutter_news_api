import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewsSearchPage extends HookConsumerWidget {
  const NewsSearchPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Text(
          "search",
          style: TextStyle(fontSize: 50),
      )
    );
  }
}
