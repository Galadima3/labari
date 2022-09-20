// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:labari/widget.dart';

import '../helper.dart/data.dart';
import '../helper.dart/news.dart';
import '../models/categorie_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<CategorieModel> categories = <CategorieModel>[];

class _HomePageState extends State<HomePage> {
  var newslist;

  getNews() async {
    Future.delayed(Duration(seconds: 3));
    News news = News();
    await news.getNews();
    newslist = news.news;
    newslist.add(news.news);

  }

  @override
  void initState() {
    getNews();
    super.initState();

    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    getNews();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: 280,
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Search News',
                    hintStyle: TextStyle(),
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Categories',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              Container(
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
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Top Headlines',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              FutureBuilder(
                future: getNews(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
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

