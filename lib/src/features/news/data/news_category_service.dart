import 'dart:convert';
import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:labari/src/features/news/domain/news_article_model.dart';

class NewsCategoryService {
  Future<List<Article>> getNewsForCategory(String category) async {
    List<Article> news = [];

    String url =
        "http://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=726bef2cc5114d618ba36683689aa4e8";
    var uri = Uri.parse(url);
    var response = await http.get(uri);
    //print(response.body);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      log(jsonData);
      NewsArticleModel newsArticleModel = NewsArticleModel.fromJson(jsonData);
      if (newsArticleModel.status == "ok") {
        news = newsArticleModel.articles!
            .where((article) =>
                article.urlToImage != null && article.description != null)
            .toList();

            return news;
      }
    } else {
      throw Exception('Failed to load news');
    }

    return news;
  }
}

final newsCategoryProvider = FutureProvider.family<List<Article>, String>((ref, category) async {
  return NewsCategoryService().getNewsForCategory(category);
});