// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class NewsHeadline extends StatelessWidget {
  final String imagePath;
  const NewsHeadline({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          width: 310,
          child: Image.network(imagePath),
        ),
      ),
    );
  }
}

class NewsTile extends StatelessWidget {
  final imagePath;
  final String headlineText;
  final String publishDay;
  const NewsTile({
    Key? key, required this.imagePath, required this.headlineText, required this.publishDay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
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
                    style:
                        TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(publishDay, style: TextStyle(color: Colors.white),),
                      SizedBox(width: 15),
                    ]
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

