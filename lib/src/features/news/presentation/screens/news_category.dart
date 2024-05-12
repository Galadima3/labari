import 'package:flutter/material.dart';
import 'package:labari/src/features/news/data/news_category_service.dart';
import 'package:labari/src/features/news/presentation/widgets/news_tile_widget.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsCategoryPage extends ConsumerWidget {
  final String newsCategory;
  const NewsCategoryPage({super.key, required this.newsCategory});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsCategoryListener = ref.watch(newsCategoryProvider(newsCategory));

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Flutter",
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            )
          ],
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Icon(Icons.share),
            ),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: newsCategoryListener.when(
          data: (data) {
            var newslist = data;

            return SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(top: 16),
                child: ListView.builder(
                  itemCount: newslist.length,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return NewsTile(
                        imgUrl: newslist[index].urlToImage,
                        title: newslist[index].title,
                        desc: newslist[index].description,
                        content: newslist[index].content,
                        posturl: newslist[index].articleUrl);
                  },
                ),
              ),
            );
          },
          error: (Object error, StackTrace stackTrace) => Center(
                child: Text(error.toString()),
              ),
          loading: () =>
              const Center(child: CircularProgressIndicator.adaptive())),
    );
  }
}
