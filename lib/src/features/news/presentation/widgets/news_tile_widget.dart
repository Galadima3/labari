// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:labari/src/features/news/presentation/screens/article_view.dart';






class NewsTile extends StatelessWidget {
  final String imgUrl, title, desc, content, posturl;

  const NewsTile(
      {Key? key,
      required this.imgUrl,
      required this.title,
      required this.desc,
      required this.posturl,
      required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                    postUrl: posturl,
                    )));
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 24),
          width: MediaQuery.of(context).size.width,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(6),
                    bottomLeft: Radius.circular(6))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      imgUrl,
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    )),
                SizedBox(
                  height: 12,
                ),
                Text(
                  title,
                  maxLines: 2,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  desc,
                  maxLines: 2,
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                )
              ],
            ),
          )),
    );
  }
}