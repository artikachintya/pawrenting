import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/community/models/article_models.dart';

class ArticleRepo extends GetxController {
  static ArticleRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<ArticleModels>> fetchArticles() async {
    final snapshot = await _db.collection('article').get();
    return snapshot.docs.map((e) {
      print("Article Data: ${e.data()}");  // Debugging
      return ArticleModels.fromSnapshot(e);
    }).toList();
  }
}