// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:labari/helper.dart/news.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:labari/src/features/auth/data/auth_repository.dart';
import 'package:labari/src/features/auth/presentation/screens/log_in_screen.dart';
import 'package:labari/src/features/news/data/news_category_list.dart';


import 'package:labari/widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends ConsumerStatefulWidget {
    const HomePage({super.key});


  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  List newslist = [];

  Future<void> getNews() async {
    await Future.delayed(Duration(seconds: 3));
    News news = News();
    await news.getNews();
    setState(() {
      newslist = news.news;
    });
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(newsCategoriesListProvider);
    //getNews();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('FlutterNews'),
          actions: [
            IconButton(
              onPressed: () => ref
                  .read(authRepositoryProvider)
                  .signOut()
                  .then((value) async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool('loggedIn', false);
                if (!context.mounted) {
                  return;
                }

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
            children: [
              SizedBox(height: 20),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20),
                  Text(
                    'Categories',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 10),
                ],
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20),
                  Text(
                    'Top Headlines',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 10),
                ],
              ),
              FutureBuilder(
                future: getNews(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.connectionState == ConnectionState.done ||
                      snapshot.hasData) {
                    return Container(
                      margin: EdgeInsets.only(top: 16),
                      child: ListView.builder(
                          itemCount: newslist.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return NewsTile(
                              imgUrl: newslist[index].urlToImage ?? "",
                              title: newslist[index].title ?? "",
                              desc: newslist[index].description ?? "",
                              content: newslist[index].content ?? "",
                              posturl: newslist[index].articleUrl ?? "",
                            );
                          }),
                    );
                  } else {
                    return Text('Wahala dey o!');
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
