import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/community/models/thread_comment.dart';

class CommentRepo extends GetxController {
  static CommentRepo get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  /// Mengambil komentar berdasarkan threadId
  // Future<List<ThreadComment>> getComments(String threadId) async {
  //   final snapshot = await _db.collection('commentThreads').where('threadId', isEqualTo: threadId).get();
  //   print("Fetched ${snapshot.docs.length} comment for thread $threadId"); // Debugging
  //   return snapshot.docs.map((e) {
  //     // print("Pet Data: ${e.data()}"); // Debugging
  //     return ThreadComment.fromSnapshot(e);
  //   }).toList();
  // }

  Future<List<ThreadComment>> getComments(String threadId) async {
  try {
    final snapshot = await _db
        .collection('commentThreads')
        .where('threadId', isEqualTo: threadId)
        .get(); // No orderBy to avoid index requirement

    print("Fetched ${snapshot.docs.length} comments for thread $threadId"); // Debugging

    List<ThreadComment> comments = snapshot.docs
        .map((e) => ThreadComment.fromSnapshot(e))
        .toList();

    // Sort manually in Dart
    comments.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    return comments;
  } catch (e) {
    print("Error fetching comments: $e");
    return []; // Return empty list on error
  }
}




  /// Menambahkan komentar baru
  Future<void> addComment(String threadId, ThreadComment comment) async {
    try {
      DocumentReference commentRef = _db.collection('commentThreads').doc(threadId).collection('comments').doc();
      await commentRef.set(comment.toJson());
      print("Komentar berhasil ditambahkan!");
    } catch (e) {
      print("Error menambahkan komentar: $e");
    }
  }
}
