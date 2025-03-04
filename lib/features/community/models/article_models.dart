import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ArticleModels {
  final String id;
  final String title;
  final String subtitle;
  final String content;
  final String imageUrl;
  final String category;


  ArticleModels({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.content,
    required this.imageUrl,
    required this.category,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'content': content,
      'imageUrl': imageUrl,
      'category': category,
    };
  }

  factory ArticleModels.fromMap(Map<String, dynamic> map) {
    return ArticleModels(
      id: map['id'] as String,
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      content: map['content'] as String,
      imageUrl: map['imageUrl'] as String,
      category: map['category'] as String
    );
  }

  factory ArticleModels.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();
    return ArticleModels(
      id: doc.id,
      title: data?['title'] ?? '',
      subtitle: data?['subtitle'] ?? '',
      content: data?['content'] ?? '',
      imageUrl: data?['imageUrl'] ?? 'assets/images/articleBanner1.png',
      category: data?['category'] ?? '',

    );
  }

  factory ArticleModels.fromJson(String source) => ArticleModels.fromMap(json.decode(source) as Map<String, dynamic>);
}
