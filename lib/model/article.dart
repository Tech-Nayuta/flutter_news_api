import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

class Article {
  const Article({
    required this.id,
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.publishedAt,
  });

  final String id;
  final String title;
  final String description;
  final String url;
  final String imageUrl;
  final DateTime publishedAt;

  Article copyWith({
    String? id,
    String? title,
    String? description,
    String? url,
    String? imageUrl,
    DateTime? publishedAt,
  }) {
    return Article(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      imageUrl: imageUrl ?? this.imageUrl,
      publishedAt: publishedAt ?? this.publishedAt,
    );
  }
}