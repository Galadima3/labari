import 'dart:convert';
import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:labari/src/features/news/domain/article_model.dart';
import 'package:labari/src/utils/constants.dart';

class NewsHeadlineService {
  Future<List<ArticleM>> getNewsHeadlines() async {
    List<ArticleM> news = [];
    try {
      String url =
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=${ApiConstant.apiKey}';
      var uri = Uri.parse(url);
      var response = await http.get(uri);

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        log(jsonData['status']);
        log(jsonData['articles'].length.toString());
        if (jsonData['status'] == "ok") {
          for (var element in jsonData["articles"]) {
            if (element['urlToImage'] != null &&
                element['description'] != null) {
              news.add(ArticleM(
                title: element['title'],
                author: element['author'] ?? 'Unknown',
                description: element['description'],
                urlToImage: element['urlToImage'],
                publishedAt: DateTime.parse(element['publishedAt']),
                content: element["content"] ?? 'Empty',
                //Keep an eye
                articleUrl: element["url"] ?? "https://images.unsplash.com/photo-1529785501650-9baa7e39c327?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              ));
            }
          }
        } else {
          log('API response status: ${jsonData['status']}');
        }
      } else {
        log('Failed to get news headlines. Status code: ${response.statusCode}');
      }
    } catch (e) {
      log('Error fetching news headlines: $e');
    }

    return news;
  }
}

final newsHeadlinesProvider = FutureProvider<List<ArticleM>>((ref) async {
  return NewsHeadlineService().getNewsHeadlines();
});



//Future Upgrade
// Future<List<ArticleM>> getNewsForCategory(String category) async {
//   final url = Uri.parse(
//       "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=${ApiConstant.apiKey}");
//   try {
//     final response = await http.get(url);
//     if (response.statusCode == 200) {
//       final jsonData = jsonDecode(response.body);
//       if (jsonData['status'] == "ok") {
//         final articles = jsonData["articles"]
//             .where((element) => element['urlToImage'] != null && element['description'] != null)
//             .map((element) => ArticleM(
//                   title: element['title'],
//                   author: element['author'] ?? 'Unknown',
//                   description: element['description'],
//                   urlToImage: element['urlToImage'],
//                   publishedAt: DateTime.parse(element['publishedAt']),
//                   content: element["content"] ?? 'Empty',
//                   articleUrl: element["url"],
//                 ))
//             .toList();
//         return articles;
//       } else {
//         log('API response status: ${jsonData['status']}');
//         return []; // Or throw an exception based on your needs
//       }
//     } else {
//       log('Failed to get news for category: $category. Status code: ${response.statusCode}');
//       return []; // Or throw an exception based on your needs
//     }
//   } catch (e) {
//     log('Error fetching news for category: $category: $e');
//     return []; // Or throw an exception based on your needs
//   }
// }
