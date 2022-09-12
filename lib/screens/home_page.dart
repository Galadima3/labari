// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:labari/screens/covid_tab.dart';
import 'package:labari/screens/sports_tab.dart';
import 'package:labari/screens/tech_tab.dart';
import 'package:labari/screens/crypto_tab.dart';
import 'package:labari/widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                //add a row
                SizedBox(
                  width: 300,
                  child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(),
                      prefixIcon: Icon(
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
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SpecialContainer(colors: Colors.blue),
                      SpecialContainer(colors: Colors.green),
                      SpecialContainer(colors: Colors.red),
                      SpecialContainer(colors: Colors.yellow),
                      SpecialContainer(colors: Colors.black),
                    ],
                  ),
                ),
                SizedBox(height: 5),
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
            )),
      ),
    );
  }
}
