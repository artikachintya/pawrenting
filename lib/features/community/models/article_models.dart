import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ArticleModels {
  final String id;
  final String title;
  final String subtitle;
  final String content;
  final String imageUrl;


  ArticleModels({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.content,
    required this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'content': content,
      'imageUrl': imageUrl,
    };
  }

  factory ArticleModels.fromMap(Map<String, dynamic> map) {
    return ArticleModels(
      id: map['id'] as String,
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      content: map['content'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  factory ArticleModels.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();
    return ArticleModels(
      id: doc.id,
      title: data?['title'] ?? '',
      subtitle: data?['subtitle'] ?? '',
      content: data?['content'] ?? '',
      imageUrl: data?['imageUrl'] ?? '',

    );
  }

  factory ArticleModels.fromJson(String source) => ArticleModels.fromMap(json.decode(source) as Map<String, dynamic>);
}
