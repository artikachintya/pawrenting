import 'package:cloud_firestore/cloud_firestore.dart';

class ThreadComment {
  final String id;
  final String threadId;
  final String userId;
  final String userName;
  final String userProfile;
  final String comment;
  final DateTime createdAt;

  ThreadComment({
    required this.id,
    required this.threadId,
    required this.userId,
    required this.userName,
    required this.userProfile,
    required this.comment,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'threadId': threadId,
      'userId': userId,
      'userName': userName,
      'userProfile': userProfile,
      'comment': comment,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  factory ThreadComment.fromJson(Map<String, dynamic> json) {
    return ThreadComment(
      id: json['id'],
      threadId: json['threadId'],
      userId: json['userId'],
      userName: json['userName'],
      userProfile: json['userProfile'],
      comment: json['comment'],
      createdAt: (json['createdAt'] as Timestamp).toDate(),
    );
  }

  factory ThreadComment.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return ThreadComment(
      id: data?['id'] ?? document.id,
      threadId: data?['threadId'] ?? '',
      userId: data?['userId'] ?? '',
      userName: data?['userName'] ?? '',
      userProfile: data?['userProfile'] ?? '',
      comment: data?['comment'] ?? '',
      createdAt: (data?['createdAt'] as Timestamp).toDate() ?? DateTime.now(),
    );
  }
}
