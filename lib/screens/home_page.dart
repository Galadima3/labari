// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors



import 'package:flutter/material.dart';
import 'package:labari/services/networking.dart';
import 'package:labari/screens/covid_tab.dart';
import 'package:labari/screens/sports_tab.dart';
import 'package:labari/screens/tech_tab.dart';
import 'package:labari/screens/crypto_tab.dart';
import 'package:labari/widget.dart';

const apiKey = '726bef2cc5114d618ba36683689aa4e8';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  void initState() {
    getNewsData();
    super.initState();
  }
  getNewsData() async {
    NetworkHelper networkHelper = NetworkHelper(
      url: 'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=$apiKey');
   var newsData = await networkHelper.getData();
    print(newsData);
  }
  @override
  Widget build(BuildContext context) {
    getNewsData();
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
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
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.menu,
                        size: 35,
                      ))
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20,),
                  Text('Top Headlines', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                ],
              ),

              Container(
                //margin: const EdgeInsets.symmetric(vertical: 5.0),
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    NewsHeadline(
                        imagePath:
                            'https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bmV3c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
                    NewsHeadline(
                        imagePath:
                            'https://images.unsplash.com/photo-1546422904-90eab23c3d7e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bmV3c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
                    NewsHeadline(
                        imagePath:
                            'https://images.unsplash.com/photo-1504711434969-e33886168f5c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bmV3c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
                    NewsHeadline(
                        imagePath:
                            'https://images.unsplash.com/photo-1588681664899-f142ff2dc9b1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bmV3c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
                    NewsHeadline(
                        imagePath:
                            'https://images.unsplash.com/photo-1585776245991-cf89dd7fc73a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fG5ld3N8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'),
                    NewsHeadline(
                        imagePath:
                            'https://images.unsplash.com/photo-1557428894-56bcc97113fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fG5ld3N8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60')
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
                tabs: [
                  Tab(
                    text: 'COVID-19',
                  ),
                  Tab(
                    text: 'Crypto',
                  ),
                  Tab(
                    text: 'Tech',
                  ),
                  Tab(
                    text: 'Sports',
                  ),
                ],
              ),
              Expanded(
                  child: TabBarView(
                children: [
                  CovidTab(),
                  CryptoTab(),
                  TechTab(),
                  SportsTab(),
                ],
              ))
            ],
          ),
          extendBody: true,
          bottomNavigationBar: BottomNavigationBar(
              elevation: 1,
              iconSize: 25,
              selectedIconTheme:
                  IconThemeData(color: Colors.blueAccent, size: 40),
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home, color: Colors.black), label: ''),
                BottomNavigationBarItem(
                    icon: Icon(Icons.trending_up, color: Colors.black),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search, color: Colors.black), label: ''),
                BottomNavigationBarItem(
                    icon: Icon(Icons.bookmark, color: Colors.black), label: ''),
              ]),
        ),
      ),
    );
  }
}
