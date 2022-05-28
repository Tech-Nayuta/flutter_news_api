import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()
class News {
  const News({
    this.status,
    this.totalResults,
    required this.articles,
  });

  final String? status;
  final int? totalResults;
  final List<Article> articles;

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}

@JsonSerializable()
class Article {
  const Article({
    required this.source,
    this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
  });

  final Source source;
  final String? title;
  final String? description;
  final String url;
  final String? urlToImage;
  final DateTime publishedAt;

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);

  Article copyWith({
    Source? source,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    DateTime? publishedAt,
  }) {
    return Article(
      source: source ?? this.source,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      publishedAt: publishedAt ?? this.publishedAt,
    );
  }
}

@JsonSerializable()
class Source {
  const Source({
    this.id, this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  final String? id;
  final String? name;
}