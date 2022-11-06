import 'package:mini_project/model/source_model.dart';

class Articel {
  final Source source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToIlamge;
  final String publishedAt;
  final String content;

  Articel({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToIlamge,
    required this.publishedAt,
    required this.content,
  });

  factory Articel.fromJson(Map<String, dynamic> json) {
    return Articel(
      source: Source.fromJson(
        json['source'],
      ),
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToIlamge: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
}
