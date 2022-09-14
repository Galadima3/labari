// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:labari/services/networking.dart';

class NewsCategory extends StatelessWidget {
  final String imagePath;
  final String text;
  const NewsCategory({super.key, required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                height: 230,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: NetworkImage(imagePath), fit: BoxFit.cover)),
                width: 270,

                // child: Image.network(imagePath, fit: BoxFit.fill,),
              ),
            ),
          ),
          Expanded(
              child: Text(
            text,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ))
        ],
      ),
    );
  }
}

class NewsTile extends StatelessWidget {
  NetworkHelper networkHelper = NetworkHelper(
      url:
          'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=726bef2cc5114d618ba36683689aa4e8');
  final imagePath;
  final String headlineText;
  final String publishDay;
  NewsTile({
    Key? key,
    required this.imagePath,
    required this.headlineText,
    required this.publishDay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            color: Colors.blue.shade500),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(imagePath),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    headlineText,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Text(
                      publishDay,
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(width: 15),
                  ])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
