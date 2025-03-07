import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class ThreadMessage {
  final String id;
  final String senderProfile;
  final String threadImage;
  final String senderName;
  final String title;
  final String details;
  final DateTime createdAt;
  bool isLiked;
  final String topic;
  int likeCount;
  int commentCount;

  ThreadMessage({
    required this.id,
    required this.senderProfile,
    required this.threadImage,
    required this.senderName,
    required this.title,
    required this.details,
    required this.createdAt,
    required this.isLiked,
    required this.topic,
    required this.likeCount,
    required this.commentCount,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'senderProfile': senderProfile.isNotEmpty ? senderProfile : TImages.user,
      'threadImage': threadImage,
      'senderName': senderName,
      'title': title,
      'details': details,
      'createdAt': FieldValue.serverTimestamp(),
      'isLiked': isLiked,
      'topic': topic,
      'likeCount': likeCount,
      'commentCount': commentCount,
    };
  }

  factory ThreadMessage.fromMap(Map<String, dynamic> map) {
    return ThreadMessage(
      id: map['id'] as String,
      senderProfile: map['senderProfile'] as String,
      threadImage: map['threadImage'] as String,
      senderName: map['senderName'] as String,
      title: map['title'] as String,
      details: map['details'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      isLiked: map['isLiked'] as bool,
      topic: map['topic'] as String,
      likeCount: map['likeCount'] as int,
      commentCount: map['commentCount'] as int,
    );
  }

  factory ThreadMessage.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return ThreadMessage(
      id: document.id,
      senderProfile: data?['senderProfile'] as String? ?? '',
      threadImage: data?['threadImage'] as String? ?? '',
      senderName: data?['senderName'] as String? ?? '',
      title: data?['title'] as String? ?? '',
      details: data?['details'] as String? ?? '',
      createdAt: (data?['createdAt'] as Timestamp).toDate(),
      isLiked: data?['isLiked'] as bool? ?? false,
      topic: data?['topic'] as String? ?? '',
      likeCount: data?['likeCount'] as int? ?? 0,
      commentCount: data?['commentCount'] as int? ?? 0,
    );
      }

  factory ThreadMessage.fromJson(String source) => ThreadMessage.fromMap(json.decode(source) as Map<String, dynamic>);
}
