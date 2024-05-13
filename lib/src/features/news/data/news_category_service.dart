import 'dart:convert';
import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:labari/src/features/news/domain/article_model.dart';
import 'package:labari/src/utils/constants.dart';

class NewsCategoryService {
  Future<List<ArticleM>> getNewsForCategory(String category) async {
    List<ArticleM> news = [];

    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=${ApiConstant.apiKey}";
    var uri = Uri.parse(url);
    var response = await http.get(uri);
    var jsonData = jsonDecode(response.body);
    if (response.statusCode == 200 && jsonData['status'] == "ok") {
      for (var element in jsonData["articles"]) {
        if (element['urlToImage'] != null && element['description'] != null) {
          final article = ArticleM(
            title: element['title'],
            author: element['author'] ?? 'Unknown',
            description: element['description'],
            urlToImage: element['urlToImage'],
            publishedAt: DateTime.parse(element['publishedAt']),
            content: element["content"] ?? 'Empty',
            articleUrl: element["url"] ?? "https://images.unsplash.com/photo-1529785501650-9baa7e39c327?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          );
          news.add(article);
        }
      }
    } else {
      log('Failed to load news');
    }
    log(news.length.toString());
    return news;
  }
}

final newsCategoryProvider =
    FutureProvider.family<List<ArticleM>, String>((ref, category) async {
  return NewsCategoryService().getNewsForCategory(category);
});
