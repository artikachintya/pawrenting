import 'package:cloud_firestore/cloud_firestore.dart';

class NotifModel{
  final String image;
  final String title;
  final String content;
  final String userId;
  final String notifId;

  NotifModel({
    required this.image,
    required this.title,
    required this.content,
    required this.userId,
    required this.notifId
  });

  toJson(){
    return {
      'image' : image,
      'title' : title,
      'content' : content,
      'userId' : userId,
      'notifId' : notifId,
    };
  }

  factory NotifModel.fromJson(Map<String, dynamic> json){
    return NotifModel(
      image: json['image'] ?? '',
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      userId: json['userId'] ?? '',
      notifId: json['notifId'] ?? '',
    );
  }

  factory NotifModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data();
    return NotifModel(
      image: data?['image'] ?? '',
      title: data?['title'] ?? '',
      content: data?['content'] ?? '',
      userId: data?['userId'] ?? '',
      notifId: data?['notifId'] ?? '',
    );
  }
}