import 'package:http/http.dart' as http;
import 'package:labari/models/article_model.dart';
import 'dart:convert';



class News {

  List<Article> news  = [];

  Future<void> getNews() async{
    String url = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=726bef2cc5114d618ba36683689aa4e8';
    var uri = Uri.parse(url);
    var response = await http.get(uri);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }

      });
    }
  }
}