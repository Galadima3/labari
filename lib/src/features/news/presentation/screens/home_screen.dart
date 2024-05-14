// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:labari/src/features/auth/data/auth_repository.dart';
import 'package:labari/src/features/auth/presentation/screens/log_in_screen.dart';
import 'package:labari/src/features/news/data/news_article_service.dart';
import 'package:labari/src/features/news/data/news_category_list.dart';
import 'package:labari/src/features/news/presentation/widgets/news_category_tile.dart';
import 'package:labari/src/features/news/presentation/widgets/news_tile_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(newsCategoriesListProvider);
    final newsHeadlines = ref.watch(newsHeadlinesProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Flutter",
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w600),
              ),
              Text(
                "News",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
              )
            ],
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => ref
                  .read(authRepositoryProvider)
                  .signOut()
                  .then((value) async {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) {
                    return LogInScreen();
                  },
                ));
              }),
              icon: Icon(Icons.logout),
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Categories',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    return NewsCategoryTile(
                      imagePath: categories[index].imageAssetUrl,
                      categoryTitle: categories[index].categorieName,
                    );
                  }),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Top Headlines',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              newsHeadlines.when(
                data: (data) {
                  final newslist = data;

                  return Container(
                    margin: EdgeInsets.only(top: 16),
                    child: ListView.builder(
                        itemCount: newslist.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return NewsTile(
                            imgUrl: newslist[index].urlToImage,
                            title: newslist[index].title,
                            desc: newslist[index].description,
                            content: newslist[index].content,
                            posturl: newslist[index].articleUrl,
                          );
                        }),
                  );
                },
                error: (error, stackTrace) => Center(
                  child: Text(error.toString()),
                ),
                loading: () =>
                    Center(child: CircularProgressIndicator.adaptive()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
