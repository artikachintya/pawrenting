// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ThreadMessage {
  final String id;
  final String senderProfile;
  final String senderName;
  final String title;
  final String subtitle;
  final DateTime createdAt;
  final int likeCount;
  final int commentCount;
  final bool isLiked;

  ThreadMessage({
    required this.id,
    required this.senderProfile,
    required this.senderName,
    required this.title,
    required this.subtitle,
    required this.createdAt,
    required this.likeCount,
    required this.commentCount,
    required this.isLiked,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'senderProfile': senderProfile,
      'senderName': senderName,
      'title': title,
      'subtitle': subtitle,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'likeCount': likeCount,
      'commentCount': commentCount,
      'isLiked': isLiked,
    };
  }

  factory ThreadMessage.fromMap(Map<String, dynamic> map) {
    return ThreadMessage(
      id: map['id'] as String,
      senderProfile: map['senderProfile'] as String,
      senderName: map['senderName'] as String,
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      likeCount: map['likeCount'] as int,
      commentCount: map['commentCount'] as int,
      isLiked: map['isLiked'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ThreadMessage.fromJson(String source) => ThreadMessage.fromMap(json.decode(source) as Map<String, dynamic>);
}


List <ThreadMessage> threadMessages = [
  ThreadMessage(id: '1', 
  senderProfile: 'banner1.jpg', 
  senderName: '@pecintakucing', 
  title: 'Tolong-tolong saya, kucing saya sakit',
  subtitle: 'yang menemukan bisa hubungi nomor saya di 012', 
  createdAt: DateTime.now().subtract(const Duration(minutes: 10)), 
  likeCount: 10, 
  commentCount: 5, 
  isLiked: true
  ),

  ThreadMessage(id: '2', 
  senderProfile: 'banner2.jpg', 
  senderName: '@pecintaanjing', 
  title: 'Tolong-tolong saya, anjing saya sakit',
  subtitle: 'yang menemukan bisa hubungi nomor saya di 034432', 
  createdAt: DateTime.now().subtract(const Duration(minutes: 10)), 
  likeCount: 8, 
  commentCount: 3, 
  isLiked: true
  ),

];



