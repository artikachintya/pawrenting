import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/community/models/article_models.dart';

class ArticleRepo extends GetxController {
  static ArticleRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<ArticleModels>> fetchArticles({required String category}) async {
    
    final QuerySnapshot snapshot;
    if(category == null || category.isEmpty){
      snapshot = await _db.collection('article').get();
    } else{
      snapshot = await _db.collection('article')
        .where('category', isEqualTo: category) // <-- Diperbaiki
        .get();
    }
    
    return snapshot.docs.map((e) {
      // print("Article Data: ${e.data()}");  // Debugging
      return ArticleModels.fromSnapshot(e as DocumentSnapshot<Map<String, dynamic>>);
    }).toList();
  }
}
