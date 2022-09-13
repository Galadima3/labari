// // To parse this JSON data, do
// //
// //     final headlines = headlinesFromJson(jsonString);

// import 'package:meta/meta.dart';
// import 'dart:convert';

// Headlines headlinesFromJson(String str) => Headlines.fromJson(json.decode(str));

// String headlinesToJson(Headlines data) => json.encode(data.toJson());

// class Headlines {
//     Headlines({
//         required this.status,
//         required this.totalResults,
//         required this.articles,
//     });

//     String status;
//     int totalResults;
//     List<Article> articles;

//     factory Headlines.fromJson(Map<String, dynamic> json) => Headlines(
//         status: json["status"],
//         totalResults: json["totalResults"],
//         articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "status": status,
//         "totalResults": totalResults,
//         "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
//     };
// }

// class Article {
//     Article({
//         required this.source,
//         required this.author,
//         required this.title,
//         required this.description,
//         required this.url,
//         required this.urlToImage,
//         required this.publishedAt,
//         required this.content,
//     });

//     Source source;
//     Author author;
//     String title;
//     String description;
//     String url;
//     String urlToImage;
//     DateTime publishedAt;
//     String content;

//     factory Article.fromJson(Map<String, dynamic> json) => Article(
//         source: Source.fromJson(json["source"]),
//         author: authorValues.map[json["author"]],
//         title: json["title"],
//         description: json["description"],
//         url: json["url"],
//         urlToImage: json["urlToImage"],
//         publishedAt: DateTime.parse(json["publishedAt"]),
//         content: json["content"],
//     );

//     Map<String, dynamic> toJson() => {
//         "source": source.toJson(),
//         "author": authorValues.reverse[author],
//         "title": title,
//         "description": description,
//         "url": url,
//         "urlToImage": urlToImage,
//         "publishedAt": publishedAt.toIso8601String(),
//         "content": content,
//     };
// }

// enum Author { BBC_NEWS }

// final authorValues = EnumValues({
//     "BBC News": Author.BBC_NEWS
// });

// class Source {
//     Source({
//         required this.id,
//         required this.name,
//     });

//     Id id;
//     Author name;

//     factory Source.fromJson(Map<String, dynamic> json) => Source(
//         id: idValues.map[json["id"]],
//         name: authorValues.map[json["name"]],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": idValues.reverse[id],
//         "name": authorValues.reverse[name],
//     };
// }

// enum Id { BBC_NEWS }

// final idValues = EnumValues({
//     "bbc-news": Id.BBC_NEWS
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     late Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }
