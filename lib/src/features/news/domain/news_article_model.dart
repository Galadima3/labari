// To parse this JSON data, do
//
//     final newsArticleModel = newsArticleModelFromJson(jsonString);

import 'dart:convert';

NewsArticleModel newsArticleModelFromJson(String str) => NewsArticleModel.fromJson(json.decode(str));

String newsArticleModelToJson(NewsArticleModel data) => json.encode(data.toJson());

class NewsArticleModel {
    final String? status;
    final int? totalResults;
    final List<Article>? articles;

    NewsArticleModel({
        this.status,
        this.totalResults,
        this.articles,
    });

    factory NewsArticleModel.fromJson(Map<String, dynamic> json) => NewsArticleModel(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: json["articles"] == null ? [] : List<Article>.from(json["articles"]!.map((x) => Article.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": articles == null ? [] : List<dynamic>.from(articles!.map((x) => x.toJson())),
    };
}

class Article {
    final Source? source;
    final String? author;
    final String? title;
    final String? description;
    final String? url;
    final String? urlToImage;
    final DateTime? publishedAt;
    final String? content;

    Article({
        this.source,
        this.author,
        this.title,
        this.description,
        this.url,
        this.urlToImage,
        this.publishedAt,
        this.content,
    });

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: json["source"] == null ? null : Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "source": source?.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt?.toIso8601String(),
        "content": content,
    };
}

class Source {
    final String? id;
    final String? name;

    Source({
        this.id,
        this.name,
    });

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
