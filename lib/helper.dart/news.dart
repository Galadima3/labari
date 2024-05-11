import 'dart:developer';

import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:labari/src/features/news/domain/article_model.dart';



class News {
  List news = [];

  Future<List> getNews() async {
    try {
      String url =
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=726bef2cc5114d618ba36683689aa4e8';
      var uri = Uri.parse(url);
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        if (jsonData['status'] == "ok") {
          for (var element in jsonData["articles"]) {
            if (element['urlToImage'] != null &&
                element['description'] != null) {
              ArticleM article = ArticleM(
                title: element['title'],
                author: element['author'] ?? 'Unknown',
                description: element['description'],
                urlToImage: element['urlToImage'],
                publshedAt: DateTime.parse(element['publishedAt']),
                content: element["content"] ?? 'Empty',
                articleUrl: element["url"],
              );
              news.add(article);

            }
          }
        }
      }
    } catch (e) {
      log(e.toString());
    } return news;
  }
}

// class NewsForCategory {
//   List<Article> news = [];

//   Future<void> getNewsForCategory(String category) async {
//     String url =
//         "http://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=726bef2cc5114d618ba36683689aa4e8";
//     var uri = Uri.parse(url);
//     var response = await http.get(uri);

//     var jsonData = jsonDecode(response.body);

//     if (jsonData['status'] == "ok") {
//       for (var element in jsonData["articles"]) {
//         if (element['urlToImage'] != null && element['description'] != null) {
//           Article article = Article(
//             title: element['title'],
//             author: element['author'] ?? 'Unknown',
//             description: element['description'],
//             urlToImage: element['urlToImage'],
//             publshedAt: DateTime.parse(element['publishedAt']),
//             content: element["content"] ?? 'Empty',
//             articleUrl: element["url"],
//           );
//           news.add(article);
//         }
//       }
//     }
//   }
// }
