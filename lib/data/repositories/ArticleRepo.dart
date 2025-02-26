import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/community/models/article_models.dart';

class ArticleRepo extends GetxController {
  static ArticleRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<Article>> fetchArticles() async {
    final snapshot = await _db.collection('articles').get();
    return snapshot.docs.map((e) {
      print("Article Data: ${e.data()}");  // Debugging
      return Article.fromSnapshot(e);
    }).toList();
  }

  createArticle(Article article) {
    print('Creating article');
    _db.collection('articles').add(article.toJson());
  }
}
